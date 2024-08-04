import 'package:app_assets/app_assets.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../core/app_mixins.dart';
import '../../core/core.dart';
import '../../router/router.dart';
import '../media_gallery.dart';

part 'gallery_body.dart';
part 'gallery_footer.dart';
part 'gallery_header.dart';

/// MediaGalleryPage ROOT Widget
class MediaGalleryPage extends ConsumerStatefulWidget {
  const MediaGalleryPage({
    required this.mediaGalleryModel,
    super.key,
  });
  final MediaGalleryModel mediaGalleryModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MediaGalleryPageController();
}

/// MediaGalleryPage CONTROLLER Widget
class _MediaGalleryPageController extends ConsumerState<MediaGalleryPage>
    with LoggerMixin, AppMixins {
  /// Late init variables
  late int currentIndex;
  late List<MediaModel> mediaModels;
  late bool navigateOnTap;

  @override
  void initState() {
    currentIndex = widget.mediaGalleryModel.index;
    mediaModels = List<MediaModel>.from(widget.mediaGalleryModel.mediaModels);
    navigateOnTap = widget.mediaGalleryModel.navigateOnTap;

    // set current elements case data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: false);

      ref
          .watch(currCaseIDProvider.notifier)
          .update((_) => mediaModels.elementAt(currentIndex).caseID);
      // set mediaModel
      ref
          .watch(currMediaModelProvider.notifier)
          .update((_) => mediaModels.elementAt(currentIndex));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavbarAwareWrapper(
        onRouteStatus: (RouteStatus routeStatus) {
          debugPrint('Media Gallery route status $routeStatus');
          bool visibility;
          if (routeStatus == RouteStatus.popped ||
              routeStatus == RouteStatus.pushedNext) {
            visibility = true;
          } else {
            visibility = false;
          }

          ref
              .watch(bottomNavVisibilityProvider.notifier)
              .update(value: visibility);
        },
        routeObserver: widget.mediaGalleryModel.routeObserver ??
            ref.read(shellRoutesObserversProvider).mediaRouteObserver,
        // ignore: deprecated_member_use
        child: _MediaGalleryPageView(this),
      );

  /// controller methods
  ///
  /// Delete media file by setting the removed flag to 0.
  /// On success we update the state of the mediaUpdateProvider to let
  /// all watcher update the UI across tabs and screen
  ///
  Future<void> onRemoveMedia(MediaModel? mediaModel) async {
    if (mediaModel == null) return;

    final index = mediaModels
        .indexWhere((element) => element.mediaID == mediaModel.mediaID);

    if (index == -1) {
      ref.read(dialogServiceProvider).showSnackBar(S.current.noMediaToDelete);
      return;
    }

    try {
      await deleteMedia(ref, mediaModel);
      if (mediaModels.isEmpty) {
        if (mounted) Navigator.of(context).pop();
      } else {
        setState(() {});
      }
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('failed to delete media');
      logger.severe(err.toString());
    }
  }

  /// Method to call on page change of the gallery view
  void onPageChanged(int index) {
    currentIndex = index;
    final caseID = mediaModels[index].caseID;
    ref.watch(currCaseIDProvider.notifier).update((_) => caseID);
    ref
        .watch(currMediaModelProvider.notifier)
        .update((_) => mediaModels.elementAt(index));
  }

  /// On press of save comment in the footer module
  void onCommentSave(MediaModel? mediaModel) {
    if (mediaModel == null) return;
    try {
      final index = mediaModels.indexWhere(
        (element) => element.mediaID == mediaModel.mediaID,
      );
      if (index == -1) {
        throw const AppFailure.generic('Media not found');
      }

      ref.read(dbProvider).mediaCollection.upsert(() => mediaModel);

      mediaModels
        ..removeAt(index)
        ..insert(index, mediaModel);
    } catch (err) {
      if (mounted) {
        context.showSnackBar(err.toAppFailure().toLocalizedString());
      }
    }
  }

  /// share media on press
  void onShare(MediaModel? mediaModel) {
    if (mediaModel == null) return;
    final path = mediaModel.fileUri ?? mediaModel.mediumUri;
    if (path?.isEmpty ?? true) return;
    ref.watch(dialogServiceProvider).shareFile([path!], 'Media File');
  }
}

/// MediaGalleryPage VIEW Widget
class _MediaGalleryPageView
    extends WidgetView<MediaGalleryPage, _MediaGalleryPageController> {
  const _MediaGalleryPageView(super.state);

  @override
  Widget build(BuildContext context) {
    /// custom app bar using preferred widget that change content
    /// on call back to show the details of the media case
    final appBar = MediaGalleryHeader(
      navigateOnTap: state.navigateOnTap,
      onPush: (caseModel) {
        CaseDetailsRoute(caseModel.caseID, activeTab: 2).push<void>(context);
      },
    );

    final body = MediaGalleryBody(
      MediaModelImageProvider(
        mediaModels: state.mediaModels,
        initialIndex: state.currentIndex,
      ),
      key: const Key('__media_gallery_body__'),
      onPageChanged: state.onPageChanged,
      doubleTapZoomable: true,
      swipeDismissible: true,
      onViewerDismissed: (index) =>
          state.ref.watch(bottomNavVisibilityProvider.notifier).toggle(),
    );

    /// return the scaffold
    final scaffold = AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 31, 6, 6),
        systemNavigationBarColor: Colors.black,
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.surface,
        appBar: appBar,
        resizeToAvoidBottomInset: false,

        /// for input to not scroll up
        body:
            KeyboardAppearenceListener(listener: (position) => {}, child: body),
        bottomSheet: GalleryFooter(
          onCommentSave: state.onCommentSave,
          onShare: state.onShare,
          onRemove: state.onRemoveMedia,
        ),
      ),
    );

    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(),
        ),
      ),
      child: scaffold,
    );
  }
}
