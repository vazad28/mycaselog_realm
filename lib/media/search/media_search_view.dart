import 'dart:async';

import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../media_gallery/media_gallery.dart';
import '../../../router/providers/router_observers.dart';
import '../../core/core.dart';
import '../media.dart';
import '../provider/extension.dart';

enum MediaSearchBarStyle { icon, bar }

class MediaSearchView extends ConsumerStatefulWidget {
  const MediaSearchView({required this.anchorStyle, super.key});

  final MediaSearchBarStyle anchorStyle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MediaSearchViewState();
}

class _MediaSearchViewState extends ConsumerState<MediaSearchView> {
  final _focusNode = FocusScopeNode();
  var _searchHistory = <String>[];
  var _results = <MediaModel>[];

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

  Iterable<Widget> getResultsWidgets() {
    final gridPair = context.gridPair(0);

    return _results
        .map(
          (mediaModel) => OpenContainer<MediaModel>(
            tappable: false,
            closedColor: context.colorScheme.surfaceContainerLow,
            openColor: context.colorScheme.surface,
            closedBuilder: (_, action) => Thumbnail(
              mediaModel: mediaModel,
              width: gridPair.second,
              // mediaRepository: ref.read(mediaRepositoryProvider),
              // mediaUploadService: ref.read(mediaUploadServiceProvider),
              onTap: action,
            ),
            openBuilder: (_, action) {
              return MediaGalleryPage(
                mediaGalleryModel: MediaGalleryModel(
                  mediaModels: _results,
                  index: _results.indexOf(mediaModel),
                  routeObserver:
                      ref.read(shellRoutesObserversProvider).mediaRouteObserver,
                ),
              );
            },
            onClosed: (_) => {},
          ),
        )
        .toList();
  }

  Future<void> handleSelection(String selectedText) async {
    final mediaModels = await ref
        .read(ftsSearchServiceProvider)
        .searchCaseMedia<MediaModel>(selectedText);

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
        _results = mediaModels;
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
      viewHintText: 'Search media',
      viewLeading: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
          searchController.clear();
          _focusNode.unfocus();
        },
      ),
      builder: (BuildContext context, SearchController controller) {
        return widget.anchorStyle == MediaSearchBarStyle.bar
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
                hintText: 'Search media',
                trailing: const [
                  _MediaCountWidget(),
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
              ? _ResultsView(children)
              : _SuggestionsView(children),
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
          return getResultsWidgets();
        } else {
          return getHistoryList();
        }
      },
    );

    return child;
  }
}

class _ResultsView extends StatelessWidget {
  const _ResultsView(this.searchResultWidgets);
  final Iterable<Widget> searchResultWidgets;

  @override
  Widget build(BuildContext context) {
    final gridPair = context.gridPair(0);
    final crossAxisCount = gridPair.first;

    final results = GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.xs),
      itemCount: searchResultWidgets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSpacing.xs,
        crossAxisSpacing: AppSpacing.xs,
      ),
      itemBuilder: (_, index) {
        return searchResultWidgets.elementAt(index);
      },
    );

    final resultsCount = SizedBox(
      height: kToolbarHeight * 0.5,
      child: Row(
        children: [
          const SizedBox(width: AppSpacing.md),
          Text(
            '${searchResultWidgets.length} RESULTS',
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

class _MediaCountWidget extends ConsumerWidget {
  const _MediaCountWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(mediaStreamProvider),
      data: (data) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Text(
          data.results.length.toString(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
