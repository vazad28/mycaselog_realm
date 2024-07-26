part of '../app_services.dart';

/// mixin to use Dialog Service
mixin DialogServiceMixin {
  WidgetRef get ref;

  DialogService get dialogService => ref.watch(dialogServiceProvider);
}

/// Riverpod provider to use the dialog service
@Riverpod(keepAlive: true)
DialogService dialogService(DialogServiceRef ref) {
  final rootContext = AppVars.appRootNavigatorKey.currentContext;

  if (rootContext == null) throw FlutterError('Root context not available');
  return DialogService(rootContext);
}

class DialogService {
  DialogService(BuildContext rootContext) : _rootContext = rootContext;

  final BuildContext _rootContext;
  BuildContext get rootContext => _rootContext;

  /// show snackbar
  void showSnackBar(String? message, {Duration? duration}) {
    AppVars.appScaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration ?? const Duration(milliseconds: 4000),
          content: Text(message ?? S.current.noMessage),
          action: SnackBarAction(
            label: S.of(_rootContext).ok,
            // ignore: unnecessary_this
            textColor: _rootContext.colorScheme.onPrimary,
            onPressed: () {}, // empty function to close snackbar Flutter 3.0
          ),
        ),
      );
  }

  /// for info dialog
  Future<void> showInfoDialog(String message) {
    return _rootContext.showInfoDialog(message);
  }

  Future<void> showLoadingDialog<T>({
    required Future<T> Function() future,
    String? message,
  }) async {
    unawaited(
      showDialog<bool>(
        context: _rootContext,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            content: Loading(
              text: message,
              showSpinner: true,
            ),
          );
        },
      ),
    );

    try {
      await future();
      if (_rootContext.mounted) {
        Navigator.of(_rootContext).pop();
      }
    } catch (e) {
      if (_rootContext.mounted) Navigator.of(_rootContext).pop();
      rethrow;
    }
  }

  /// confirm dialog
  Future<bool> showConfirmDialog(
    String message, {
    String? title,
    String? defaultActionText,
    String? cancelActionText,
  }) {
    return _rootContext.showConfirmDialog(
      message,
      title: title,
      defaultActionText: defaultActionText,
      cancelActionText: cancelActionText,
    );
  }

  /// open date picker
  Future<DateTime?> openDatePicker({
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DatePickerMode? initialDatePickerMode,
    Widget Function(BuildContext, Widget?)? builder,
  }) {
    return _rootContext.openDatePicker(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: initialDatePickerMode,
      builder: builder,
    );
  }

  /// Form submit
  Future<T> runBusyResult<T extends Object>(Future<T> future,
      {String? message, int? delay}) async {
    Timer? timer;

    final dialog = showModalBottomSheet<void>(
      isDismissible: false,
      context: _rootContext,
      builder: (context) {
        return LoadingBottomSheet(text: message ?? 'submitting..');
      },
    );

    /// start the timer
    timer = Timer(const Duration(seconds: 10), () {
      // ignore: unnecessary_this
      _rootContext.showSnackBar('Server request timed out');
      Navigator.of(_rootContext).pop();
    });

    if (delay != null) {
      await Future<void>.delayed(Duration(milliseconds: delay));
    }

    return future.then((result) {
      timer?.cancel();
      if (_rootContext.mounted) Navigator.of(_rootContext).pop();
      return dialog.then((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 300));
        return result;
      });
    }).catchError((Object err, st) {
      if (_rootContext.mounted) Navigator.of(_rootContext).pop();
      if (_rootContext.mounted) _rootContext.showInfoDialog(err.toString());
      return Future<T>.error(err);
    });
  }

  /// share files
  Future<Result<ShareResult, Exception>> shareFile(
    List<String> filePaths,
    String title,
  ) async {
    try {
      final xFiles = filePaths.map(XFile.new).toList();
      final shareResult = await Share.shareXFiles(xFiles, text: title);
      return Result.success(shareResult);
    } catch (err) {
      return Result.failure(Exception(err));
    }
  }

  /// Open page on root navigator
  Future<T?> pushToRootNavigator<T>(Widget page) {
    return Navigator.of(_rootContext).push<T?>(
      MaterialPageRoute(
        builder: (_) {
          return page;
        },
      ),
    );
  }

  /// Local auth dialog
  Future<bool> localAuth() async {
    try {
      final localAuth = LocalAuthentication();
      final isAuthenticated = await localAuth.authenticate(
        localizedReason: S.current.biometricAuthMessage,
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      if (isAuthenticated) return true;
      return false;
    } on PlatformException catch (e) {
      await showInfoDialog(e.toString());
      return false;
    } catch (err) {
      showSnackBar(err.toString());
      return false;
    }
  }
}
