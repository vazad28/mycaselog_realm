import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/app_services.dart';
import '../notes.dart';

enum NotesSearchBarStyle { icon, bar }

class NotesSearchAnchor extends ConsumerStatefulWidget {
  const NotesSearchAnchor({required this.anchorStyle, super.key});

  final NotesSearchBarStyle anchorStyle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotesSearchAnchorState();
}

class _NotesSearchAnchorState extends ConsumerState<NotesSearchAnchor> {
  final _focusNode = FocusScopeNode();
  var _searchHistory = <String>[];
  RealmResults<NoteModel>? _results;

  bool _showResults = false;

  final searchController = SearchController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _searchHistory = ref.read(localStorageProvider).getNotesRecentSearches();
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Iterable<Widget> getHistoryList(SearchController controller) {
    final input = controller.value.text.trim();
    final result = input.isNotEmpty
        ? _searchHistory
            .where(RegExp(input, caseSensitive: false).hasMatch)
            .toList()
        : _searchHistory;

    return result.map(
      (String suggestion) => ListTile(
        leading: const Icon(Icons.history),
        title: Text(suggestion),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            controller
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

  Iterable<Widget> getResultsWidgets(SearchController controller) {
    return _results!.map(
      (noteModel) => NotesSearchResultTile(
        noteModel: noteModel,
      ),
    );
  }

  void handleSelection(String selectedText) {
    final noteModels =
        ref.read(ftsSearchServiceProvider).searchNotes(selectedText);

    setState(() {
      try {
        if (!_searchHistory.contains(selectedText)) {
          _searchHistory.insert(0, selectedText);
        }

        if (_searchHistory.length >= 25) {
          _searchHistory.removeLast();
        }

        ref.read(localStorageProvider).setNotesRecentSearches(_searchHistory);
        _results = noteModels;
        _showResults = true;

        searchController.value = TextEditingValue(text: selectedText);
      } catch (err) {
        debugPrint(err.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final child = SearchAnchor(
      searchController: searchController,
      textInputAction: TextInputAction.search,
      viewLeading: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
          searchController.clear();
          _focusNode.unfocus();
        },
      ),
      builder: (BuildContext context, SearchController controller) {
        return widget.anchorStyle == NotesSearchBarStyle.bar
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
                hintText: 'Search notes',
                //trailing: widget.trailing,
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
              ? _ResultsView(children)
              : _SuggestionsView(children),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        if (searchController.text.isEmpty) {
          _showResults = false;
          if (_searchHistory.isNotEmpty) {
            return getHistoryList(searchController);
          }
          return <Widget>[
            const Center(
              child: Text('No search history'),
            ).paddingOnly(top: AppSpacing.xxlg),
          ];
        }

        if (_showResults) {
          return getResultsWidgets(searchController);
        } else {
          return getHistoryList(searchController);
        }
      },
    );

    return child;
  }
}

class _ResultsView extends StatelessWidget {
  const _ResultsView(this.children);

  final Iterable<Widget> children;
  @override
  Widget build(BuildContext context) {
    final results = ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => children.elementAt(index),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: children.length,
    );

    final resultsCount = SizedBox(
      height: kToolbarHeight * 0.5,
      child: Row(
        children: [
          const SizedBox(width: AppSpacing.md),
          Text(
            '${children.length} RESULTS',
            style: context.textTheme.bodyMedium?.lighter(),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        resultsCount,
        Divider(
          height: 1,
          color: context.colorScheme.onSurface.lighter(0.8),
        ),
        Expanded(child: results),
      ],
    );
  }
}

class _SuggestionsView extends StatelessWidget {
  const _SuggestionsView(this.children);
  final Iterable<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => children.elementAt(index),
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemCount: children.length,
    );
  }
}
