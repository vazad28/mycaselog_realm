part of 'media_gallery_page.dart';

class GalleryFooter extends ConsumerStatefulWidget {
  const GalleryFooter({
    required this.onCommentSave,
    required this.onShare,
    required this.onRemove,
    super.key,
  });

  final void Function(MediaModel?) onCommentSave;
  final void Function(MediaModel?) onRemove;
  final void Function(MediaModel?) onShare;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GalleryFooterState();
}

class _GalleryFooterState extends ConsumerState<GalleryFooter> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  bool _showSendButton = false;

  @override
  void initState() {
    _focusNode.addListener(focusListener);
    super.initState();
  }

  void focusListener() {
    setState(() {
      _showSendButton = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<MediaModel?>(currMediaModelProvider, (previous, next) {
      if (previous != next) {
        _controller.value = TextEditingValue(text: next?.comment ?? '');
      }
    });

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Focus(
        child: Row(
          children: [
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'comment',
                ),
                maxLines: null,
                controller: _controller,
                focusNode: _focusNode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (_showSendButton)
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () =>
                    widget.onCommentSave(ref.read(currMediaModelProvider)),
              ),
            if (!_showSendButton) ...[
              IconButton(
                onPressed: () =>
                    widget.onShare(ref.read(currMediaModelProvider)),
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () => context
                    .showConfirmDialog(
                  S.of(context).contentHardDeleteWarning,
                )
                    .then((res) {
                  if (!res) return;

                  widget.onRemove(ref.read(currMediaModelProvider));
                }),
                icon: const Icon(Icons.delete),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
