part of 'search_page.dart';

class ResultsView<T> extends StatelessWidget {
  const ResultsView(this.searchResultWidgets, {super.key});

  final Iterable<Widget> searchResultWidgets;
  @override
  Widget build(BuildContext context) {
    final results = ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => searchResultWidgets.elementAt(index),
      itemCount: searchResultWidgets.length,
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
