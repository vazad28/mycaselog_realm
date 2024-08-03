import 'package:flutter/material.dart';

/// Common search bar
class StatsSearchAnchor extends StatefulWidget {
  // ignore: public_member_api_docs
  const StatsSearchAnchor({
    required this.onTap,
    required this.suggestions,
    required this.searchController,
    super.key,
    this.hintText,
    this.trailing,
  });

  final String? hintText;
  final void Function(String? query) onTap;
  final SearchController searchController;
  final Widget suggestions;
  final Iterable<Widget>? trailing;

  @override
  State<StatefulWidget> createState() => StatsSearchAnchorState();
}

// ignore: public_member_api_docs
class StatsSearchAnchorState extends State<StatsSearchAnchor> {
  String? _getTokenizedQuery(String query) {
    var searchTermTokenized = '';

    if (query.length == 2) {
      searchTermTokenized = '$query OR ${query.split('').reversed.join()}';
    } else {
      if (query.isEmpty) return null;
      final split = query.split(RegExp(r'\s+'));

      if (split.length > 1) {
        searchTermTokenized = split.map((term) => '$term*').join(' ');
      } else {
        searchTermTokenized = '$query*';
      }
    }

    return searchTermTokenized;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: widget.searchController,
      viewOnSubmitted: (value) {
        widget.onTap.call(_getTokenizedQuery(value));
        widget.searchController.closeView(value);
      },
      //viewOnChanged: (value) => ,
      builder: (BuildContext context, SearchController controller) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: controller.openView,
          child: IgnorePointer(
            child: SearchBar(
              controller: controller,
              elevation: const WidgetStatePropertyAll<double>(0),
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16),
              ),
              onTap: () {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              hintText: widget.hintText,
              trailing: widget.trailing,
            ),
          ),
        );
      },
      viewBuilder: (_) {
        return widget.suggestions;
      },
      suggestionsBuilder: (_, ctrl) {
        return [];
      },
    );
  }
}
