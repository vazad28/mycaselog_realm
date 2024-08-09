import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../auto_complete/auto_complete.dart';

class AddCaseAutoCompleteDelegate extends SearchDelegate<String?> {
  AddCaseAutoCompleteDelegate({
    required this.autocompleteListType,
    this.onQueryStringList,
    this.onQueryMapList,
  }) : assert(
          (onQueryStringList == null) ^ (onQueryMapList == null),
          'Either onQueryStringList or onQueryMapList method must be provided',
        );

  final AutoCompleteDataType autocompleteListType;
  final Future<List<String>>? Function(String?)? onQueryStringList;
  final List<MapEntry<String, String>>? Function(String?)? onQueryMapList;

  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isEmpty) return [];
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        tooltip: 'Back',
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, query);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance
        .scheduleFrameCallback((_) => Navigator.of(context).pop(query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: onQueryStringList?.call(query),
      builder: (_, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        if (snapshot.hasError) {
          return Loading(
            text: snapshot.error.toString(),
          );
        }

        return autocompleteListType == AutoCompleteDataType.string
            ? SuggestionListForString(
                query: query,
                suggestions: snapshot.data,
                onAppend: (suggestion) => query = suggestion,
                onSelect: (suggestion) {
                  Navigator.of(context).pop(suggestion.sentenceCase);
                },
              )
            : SuggestionListForMapEntry(
                query: query,
                suggestions: onQueryMapList?.call(query),
                onAppend: (suggestion) => query = suggestion,
                onSelect: (suggestion) {
                  Navigator.of(context).pop(suggestion.sentenceCase);
                },
              );
      },
    );
  }
}
