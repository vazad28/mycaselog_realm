// ignore: prefer_relative_imports
import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../controller/upload_controller.dart';
import 'upload_overlay.dart';

class MediaUploadOverlayWidget extends StatelessWidget {
  const MediaUploadOverlayWidget({
    required this.mediaModel,
    required this.uploadController,
    this.width,
    super.key,
  });

  final MediaModel mediaModel;
  final UploadController? uploadController;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 96,
      child: uploadController == null
          ? const SizedBox.shrink()
          : _MediaUploadOverlayWidget(
              uploadController: uploadController!,
            ),
    );
  }
}

class _MediaUploadOverlayWidget extends StatelessWidget {
  const _MediaUploadOverlayWidget({
    required this.uploadController,
  });

  final UploadController uploadController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: uploadController,
      builder: (context, child) {
        final status = uploadController.uploadModel.uploadStatus;
        if (status == UploadStatus.success) {
          return const SizedBox.shrink();
        }

        if (status == UploadStatus.failed) {
          _onFailure(context);
        }

        return UploadOverlay(
          status: status,
          uploadProgress: uploadController.uploadModel.progress,
          onRetry: uploadController.retryUpload,
          onCancel: uploadController.stopUpload,
          onRemove: uploadController.removeMedia,
        );
      },
    );
  }

  void _onFailure(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Media upload failed'),
          ),
        );
      }
    });
  }
}
