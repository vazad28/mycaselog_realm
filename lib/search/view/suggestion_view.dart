part of 'search_page.dart';

class SuggestionsView extends ConsumerWidget {
  const SuggestionsView(this.children, this.onRemove, {super.key});

  final Iterable<Widget> children; // Make children a concrete List type
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => DismissibleListTile(
        key: ValueKey(index), // Add a unique key for each DismissibleListTile
        child: children.elementAt(index), // Use direct indexing for efficiency
        onDismissed: () =>
            onRemove(index), // Capture dismissal direction (optional)
      ),
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemCount: children.length,
    );
  }
}
