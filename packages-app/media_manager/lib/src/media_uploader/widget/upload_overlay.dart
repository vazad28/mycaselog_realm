// ignore: prefer_relative_imports
import 'package:app_data/app_data.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MediaUploadAction { removeMedia, retryUpload }

@immutable
class UploadOverlay extends StatelessWidget {
  const UploadOverlay({
    required this.status,
    required this.onRetry,
    required this.onCancel,
    required this.onRemove,
    super.key,
    this.uploadProgress = 0.0,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  final UploadStatus status;
  final double uploadProgress;
  final VoidCallback onRetry;
  final VoidCallback onCancel;
  final VoidCallback onRemove;
  final Duration transitionDuration;

  bool get _isUploading => status == UploadStatus.uploading;

  bool get _isProcessing => status == UploadStatus.processing;

  bool get _isUploaded => status == UploadStatus.success;

  void _onActionSelection(MediaUploadAction action) {
    switch (action) {
      case MediaUploadAction.retryUpload:
        onRetry.call();
      case MediaUploadAction.removeMedia:
        onRemove.call();
    }
  }

  Future<MediaUploadAction?> _onPressed(BuildContext context) {
    return showModalBottomSheet<MediaUploadAction?>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            children: [
              ListTile(
                leading: const Icon(Icons.restart_alt),
                title: Text(S.of(context).retryUpload),
                onTap: () =>
                    Navigator.of(context).pop(MediaUploadAction.retryUpload),
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: Text(S.of(context).stashUpload),
                onTap: () =>
                    Navigator.of(context).pop(MediaUploadAction.removeMedia),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final res = await _onPressed(context);
        if (res == null) return;
        _onActionSelection(res);
      },
      child: Stack(
        children: [
          ButtonShapeWidget(
            transitionDuration: transitionDuration,
            isUploaded: _isUploaded,
            isUploading: _isUploading,
            isProcessing: _isProcessing,
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: transitionDuration,
              opacity: _isUploading || _isProcessing ? 1.0 : 0.0,
              curve: Curves.ease,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ProgressIndicatorWidget(
                    uploadProgress: uploadProgress,
                    isUploading: _isUploading,
                    isProcessing: _isProcessing,
                  ),
                  if (_isUploading)
                    Icon(
                      Icons.stop,
                      size: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({
    required this.isUploading,
    required this.isUploaded,
    required this.isProcessing,
    required this.transitionDuration,
    super.key,
  });

  final bool isUploading;
  final bool isUploaded;
  final bool isProcessing;
  final Duration transitionDuration;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var shape = const ShapeDecoration(
      shape: StadiumBorder(),
      color: CupertinoColors.lightBackgroundGray,
    );

    if (isUploading || isProcessing) {
      shape = ShapeDecoration(
        shape: const CircleBorder(),
        color: Colors.white.withOpacity(0),
      );
    }

    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedOpacity(
          duration: transitionDuration,
          opacity: isUploading || isProcessing ? 0.0 : 1.0,
          curve: Curves.ease,
          child: Text(
            isUploaded ? '' : 'queued',
            textAlign: TextAlign.center,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    required this.uploadProgress,
    required this.isUploading,
    required this.isProcessing,
    super.key,
  });

  final double uploadProgress;
  final bool isUploading;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: uploadProgress),
        duration: const Duration(milliseconds: 200),
        builder: (context, progress, child) {
          return CircularProgressIndicator(
            backgroundColor: isUploading
                ? Theme.of(context).colorScheme.primaryContainer
                : Colors.white.withOpacity(0),
            valueColor: AlwaysStoppedAnimation(
              isProcessing
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
            ),
            value: isProcessing ? null : progress,
          );
        },
      ),
    );
  }
}
