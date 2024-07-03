import 'dart:async';

import 'package:flutter/material.dart';

/// States that your button can assume via the controller
// ignore: public_member_api_docs
enum ButtonState { idle, loading, success, error }

enum LoadingButtonType { text, filled }

/// Initalize class
class LoadingButton extends StatefulWidget {
  /// initalize constructor
  const LoadingButton({
    required this.controller,
    required this.onPressed,
    required this.child,
    super.key,
    this.buttonType = LoadingButtonType.filled,
    this.color = Colors.lightBlue,
    this.height = kMinInteractiveDimension,
    this.width = 300,
    this.loaderSize = 24.0,
    this.loaderStrokeWidth = 2.0,
    this.animateOnTap = true,
    this.valueColor, // = Colors.white,
    this.borderRadius = 32,
    this.elevation = 1,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCirc,
    this.errorColor = Colors.red,
    this.successColor,
    this.resetDuration = const Duration(seconds: 15),
    this.resetAfterDuration = false,
    this.successIcon = Icons.check,
    this.failedIcon = Icons.close,
    this.completionCurve = Curves.elasticOut,
    this.completionDuration = const Duration(milliseconds: 1000),
    this.disabledColor,
  });

  /// Whether to trigger the animation on the tap event
  final bool animateOnTap;

  /// The radius of the button border
  final double borderRadius;

  final LoadingButtonType? buttonType;

  /// The button's label
  final Widget child;

  /// The primary color of the button
  final Color? color;

  /// The success and failed animation curve
  final Curve completionCurve;

  /// The duration of the success and failed animation
  final Duration completionDuration;

  /// Button controller, now required
  final LoadingButtonController controller;

  /// The curve of the shrink animation
  final Curve curve;

  /// The color of the button when it is disabled
  final Color? disabledColor;

  /// The duration of the button animation
  final Duration duration;

  /// The elevation of the raised button
  final double elevation;

  /// The color of the button when it is in the error state
  final Color? errorColor;

  /// The icon for the failed state
  final IconData failedIcon;

  /// The vertical extent of the button.
  final double height;

  /// The size of the CircularProgressIndicator
  final double loaderSize;

  /// The stroke width of the CircularProgressIndicator
  final double loaderStrokeWidth;

  /// The callback that is called when
  /// the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// reset the animation after specified duration,
  /// use resetDuration parameter to set Duration, defaults to 15 seconds
  final bool resetAfterDuration;

  /// Duration after which reset the button
  final Duration resetDuration;

  /// The color of the button when it is in the success state
  final Color? successColor;

  /// The icon for the success state
  final IconData successIcon;

  /// The color of the static icons
  final Color? valueColor;

  /// The horiztonal extent of the button.
  final double? width;

  @override
  State<StatefulWidget> createState() => LoadingButtonState();

  Duration get _borderDuration {
    return Duration(milliseconds: (duration.inMilliseconds / 2).round());
  }
}

/// Class implementation
class LoadingButtonState extends State<LoadingButton>
    with TickerProviderStateMixin {
  StreamSubscription<ButtonState?>? streamSubscription;

  late Animation<BorderRadius?> _borderAnimation;
  late AnimationController _borderController;
  late Animation<double> _bounceAnimation;
  late AnimationController _buttonController;
  late AnimationController _checkButtonControler;
  ButtonState? _currentState;
  late Animation<double> _squeezeAnimation;
  final StreamController<ButtonState?> _state = StreamController.broadcast()
    ..add(ButtonState.idle);

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonControler.dispose();
    _borderController.dispose();
    streamSubscription?.cancel();
    _state.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _buttonController =
        AnimationController(duration: widget.duration, vsync: this);

    _checkButtonControler =
        AnimationController(duration: widget.completionDuration, vsync: this);

    _borderController =
        AnimationController(duration: widget._borderDuration, vsync: this);

    _bounceAnimation = Tween<double>(begin: 0, end: widget.height).animate(
      CurvedAnimation(
        parent: _checkButtonControler,
        curve: widget.completionCurve,
      ),
    );
    _bounceAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation =
        Tween<double>(begin: widget.width, end: widget.height).animate(
      CurvedAnimation(parent: _buttonController, curve: widget.curve),
    );

    _squeezeAnimation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed && widget.animateOnTap) {
          widget.onPressed?.call();
        }

        streamSubscription = _state.stream.listen((value) {
          //print('Value from controller: $value');
          _currentState = value;
        });
      });

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(widget.borderRadius),
      end: BorderRadius.circular(widget.height),
    ).animate(_borderController);

    _borderAnimation.addListener(() {
      setState(() {});
    });

    // There is probably a better way of doing this...
    _state.stream.listen((event) {
      if (!mounted || event == null) return;
      widget.controller._state.sink.add(event);
    });

    widget.controller._addListeners(_start, _stop, _success, _error, _reset);
  }

  Future<void> _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      widget.onPressed?.call();
    }
  }

  void _start() {
    if (!mounted) return;
    _state.sink.add(ButtonState.loading);
    _borderController.forward();
    _buttonController.forward();
    if (widget.resetAfterDuration) _reset();
  }

  void _stop() {
    if (!mounted) return;
    _state.sink.add(ButtonState.idle);
    _buttonController.reverse();
    _borderController.reverse();
  }

  void _success() {
    if (!mounted) return;
    _state.sink.add(ButtonState.success);
    _checkButtonControler.forward();
  }

  void _error() {
    if (!mounted) return;
    _state.sink.add(ButtonState.error);
    _checkButtonControler.forward();
  }

  Future<void> _reset() async {
    if (widget.resetAfterDuration) {
      await Future<void>.delayed(widget.resetDuration);
    }
    if (!mounted) return;
    _state.sink.add(ButtonState.idle);
    unawaited(_buttonController.reverse());
    unawaited(_borderController.reverse());
    _checkButtonControler.reset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueColor = widget.buttonType == LoadingButtonType.text
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onPrimary;

    final Widget check = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.successColor ?? theme.primaryColor,
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.successIcon,
              color: widget.valueColor ?? valueColor,
            )
          : null,
    );

    final Widget cross = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.errorColor,
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.failedIcon,
              color: widget.valueColor ?? valueColor,
            )
          : null,
    );

    final Widget loader = SizedBox(
      height: widget.loaderSize,
      width: widget.loaderSize,
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(widget.valueColor ?? valueColor),
        strokeWidth: widget.loaderStrokeWidth,
      ),
    );

    final Widget childStream = StreamBuilder<ButtonState?>(
      stream: _state.stream,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snapshot.data == ButtonState.loading ? loader : widget.child,
        );
      },
    );

    final btn = widget.buttonType == LoadingButtonType.text
        ? ButtonTheme(
            shape: RoundedRectangleBorder(
              borderRadius: _borderAnimation.value ?? BorderRadius.zero,
            ),
            disabledColor: widget.disabledColor,
            padding: EdgeInsets.zero,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(_squeezeAnimation.value, widget.height),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                //primary: widget.color,
                elevation: widget.elevation,
                padding: EdgeInsets.zero,
              ),
              onPressed: widget.onPressed == null ? null : _btnPressed,
              child: childStream,
            ),
          )
        : ButtonTheme(
            shape: RoundedRectangleBorder(
              borderRadius: _borderAnimation.value ?? BorderRadius.zero,
            ),
            disabledColor: widget.disabledColor,
            padding: EdgeInsets.zero,
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(_squeezeAnimation.value, widget.height),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                elevation: 0,
                padding: EdgeInsets.zero,
              ),
              onPressed: widget.onPressed == null ? null : _btnPressed,
              child: childStream,
            ),
          );

    return SizedBox(
      height: widget.height,
      child: Center(
        child: _currentState == ButtonState.error
            ? cross
            : _currentState == ButtonState.success
                ? check
                : btn,
      ),
    );
  }
}

/// Options that can be chosen by the controller
/// each will perform a unique animation
class LoadingButtonController {
  LoadingButtonController() {
    streamSubscription = _state.stream.listen((value) {
      _currentState = value;
    });
  }

  late final StreamSubscription<ButtonState?> streamSubscription;

  ButtonState? _currentState;
  VoidCallback? _errorListener;
  VoidCallback? _resetListener;
  VoidCallback? _startListener;

  final StreamController<ButtonState> _state = StreamController.broadcast()
    ..add(ButtonState.idle);

  VoidCallback? _stopListener;
  VoidCallback? _successListener;

  /// A read-only stream of the button state
  Stream<ButtonState> get stateStream => _state.stream;

  /// Gets the current state
  ButtonState? get currentState => _currentState;

  /// Notify listeners to start the loading animation
  void start() {
    _startListener?.call();
  }

  /// Notify listeners to start the stop animation
  void stop() {
    _stopListener?.call();
  }

  /// Notify listeners to start the sucess animation
  void success() {
    _successListener?.call();
  }

  /// Notify listeners to start the error animation
  void error() {
    _errorListener?.call();
  }

  /// Notify listeners to start the reset animation
  void reset() {
    _resetListener?.call();
  }

  void dispose() {
    streamSubscription.cancel();
  }

  void _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _errorListener = errorListener;
    _resetListener = resetListener;
  }
}
