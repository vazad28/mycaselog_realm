import 'dart:async';

import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/core.dart';
import '../search.dart';

part './search_results_view.dart';
part './suggestion_view.dart';

enum SearchBarStyle { icon, bar }

class SearchView<T> extends ConsumerStatefulWidget {
  const SearchView({
    required this.anchorStyle,
    required this.onSearch,
    this.hintText = 'search',
    super.key,
  });

  final SearchBarStyle anchorStyle;
  final RealmResults<T>? Function(String) onSearch;
  final String? hintText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState<T>();
}

class _SearchViewState<T> extends ConsumerState<SearchView<T>> {
  final _focusNode = FocusScopeNode();
  var _searchHistory = <String>[];

  RealmResults<T>? _results;

  bool _showResults = false;

  final searchController = SearchController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _searchHistory =
          ref.read(localStorageProvider).getCaseMediaRecentSearches();
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Iterable<Widget> getHistoryList() {
    final input = searchController.value.text.trim();
    final result = input.isNotEmpty
        ? _searchHistory
            .where(RegExp(input, caseSensitive: false).hasMatch)
            .toList()
        : _searchHistory;

    return result.map(
      (String suggestion) => ListTile(
        dense: true,
        leading: const Icon(Icons.history),
        title: Text(
          suggestion,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            searchController
              ..text = suggestion
              ..selection =
                  TextSelection.collapsed(offset: searchController.text.length);

            _focusNode.requestFocus();
          },
        ),
        onTap: () => handleSelection(suggestion),
      ),
    );
  }

  Iterable<Widget>? getResultsWidgets() {
    return _results?.map((model) {
      if (T == CaseModel) {
        return CasesSearchResultTile(
            caseModel: model as CaseModel,
            key: Key('__CasesSearchResultTile_${model.caseID}_key__'));
      } else {
        return MediaSearchResultTile(
          mediaModel: model as MediaModel,
          key: Key('__MediaSearchResultTile_${model.mediaID}_key__'),
          results: _results! as RealmResults<MediaModel>,
          width: 90,
        );
      }
    });
  }

  Future<void> handleSelection(String selectedText) async {
    setState(() {
      try {
        if (!_searchHistory.contains(selectedText)) {
          _searchHistory.insert(0, selectedText);
        }

        if (_searchHistory.length >= 25) {
          _searchHistory.removeLast();
        }

        ref
            .read(localStorageProvider)
            .setCaseMediaRecentSearches(_searchHistory);

        _results = widget.onSearch(selectedText);

        _showResults = true;

        searchController.value = TextEditingValue(text: selectedText);
      } catch (err) {
        ref
            .read(dialogServiceProvider)
            .showSnackBar('Error handling selection');
        debugPrint(err.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = SearchAnchor(
      searchController: searchController,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.visiblePassword,
      viewHintText: widget.hintText,
      viewLeading: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
          searchController.clear();
          _focusNode.unfocus();
        },
      ),
      builder: (BuildContext context, SearchController controller) {
        return widget.anchorStyle == SearchBarStyle.bar
            ? SearchBar(
                controller: controller,
                focusNode: _focusNode,
                elevation: const WidgetStatePropertyAll<double>(0),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: () {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
                hintText: widget.hintText,
                trailing: [
                  if (T == CaseModel)
                    const CasesCountWidget()
                  else
                    const MediaCountWidget(),
                ],
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
      },
      viewOnSubmitted: (value) {
        searchController.text = ''; //<- important to trigger suggestion builder
        handleSelection(value.trim());
      },
      viewBuilder: (children) {
        return PageTransitionSwitcher(
          reverse: !_showResults,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: _showResults
              ? ResultsView<T>(children)
              : SuggestionsView(children, (int index) {
                  _searchHistory.removeAt(index);
                  ref
                      .read(localStorageProvider)
                      .setCaseMediaRecentSearches(_searchHistory);
                }),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        if (searchController.text.isEmpty) {
          _showResults = false;
          if (_searchHistory.isNotEmpty) {
            return getHistoryList();
          }
          return <Widget>[
            const Center(
              child: Text('No search history'),
            ).paddingOnly(top: AppSpacing.xxlg),
          ];
        }

        if (_showResults) {
          return getResultsWidgets() ?? [const Loading(text: 'No results')];
        } else {
          return getHistoryList();
        }
      },
    );

    return child;
  }
}
