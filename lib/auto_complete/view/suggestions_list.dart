import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:misc_packages/misc_packages.dart';

import '../auto_complete.dart';

class SuggestionListForString extends StatelessWidget {
  const SuggestionListForString({
    required this.suggestions,
    required this.query,
    required this.onSelect,
    super.key,
    this.onAppend,
    this.onMerge,
  });

  final ValueChanged<String>? onAppend;
  final MergeAutocomplete? onMerge;
  final ValueChanged<String> onSelect;
  final String query;
  final List<String>? suggestions;

  @override
  Widget build(BuildContext context) {
    if (suggestions?.isEmpty ?? true) {
      return const Loading(
        text: 'No suggestions',
      );
    }

    return ListView.separated(
      itemCount: suggestions!.length,
      itemBuilder: (context, i) {
        final suggestion = suggestions![i];

        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
          leading: Icon(
            Icons.history,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
          ),
          title: HighlightMatchingText(suggestion: suggestion, query: query),
          onTap: () => onSelect(suggestion),
          trailing: onAppend == null
              ? null
              : IconButton(
                  icon: const Icon(Icons.keyboard_arrow_up_sharp),
                  onPressed: () => onAppend!.call(suggestion),
                ),
          onLongPress: () => context
              .showInputDialog<String?>(
            title: 'Edit Data',
            value: suggestion,
          )
              .then((value) {
            if (value != null && value != suggestion) {
              onMerge?.call(suggestion, value);
            }
          }),
        );
      },
      separatorBuilder: (_, index) {
        return const Divider(
          height: 0.5,
          indent: 56,
        );
      },
    );
  }
}

class SuggestionListForMapEntry extends StatelessWidget {
  const SuggestionListForMapEntry({
    required this.suggestions,
    required this.query,
    required this.onSelect,
    super.key,
    this.onAppend,
    this.onMerge,
  });

  final ValueChanged<String>? onAppend;
  final MergeAutocomplete? onMerge;
  final ValueChanged<String> onSelect;
  final String query;
  final List<MapEntry<String, String>>? suggestions;

  @override
  Widget build(BuildContext context) {
    if (suggestions?.isEmpty ?? true) {
      return const Loading(
        text: 'No suggestions',
      );
    }

    return ListView.separated(
      itemCount: suggestions!.length,
      itemBuilder: (context, i) {
        final suggestion = suggestions![i];
        final title = '${suggestion.key} - ${suggestion.value}';

        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
          leading: Icon(
            Icons.history,
            color: Theme.of(context).colorScheme.shadow,
          ),
          title: HighlightMatchingText(suggestion: title, query: query),
          onTap: () => onSelect(suggestion.key),
          trailing: onAppend == null
              ? null
              : IconButton(
                  icon: const Icon(Icons.keyboard_arrow_up_sharp),
                  onPressed: () => onAppend!.call(suggestion.key),
                ),
          onLongPress: () => context
              .showInputDialog<String?>(
            title: 'Edit Data',
            value: suggestion.key,
          )
              .then((value) {
            if (value != null && value != suggestion.value) {
              onMerge?.call(suggestion.key, value);
            }
          }),
        );
      },
      separatorBuilder: (_, index) {
        return const Divider(
          height: 0.5,
          indent: 56,
        );
      },
    );
  }
}
