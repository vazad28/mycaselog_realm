import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollReactiveFabButton extends StatefulWidget {
  const ScrollReactiveFabButton(
    this.scrollController, {
    required this.title,
    super.key,
    this.openBuilder,
    this.closedIcon,
    this.openIcon,
    this.onTap,
    this.hide = false,
  });

  final Widget Function(BuildContext, void Function())? openBuilder;
  final IconData? closedIcon;
  final bool hide;
  final VoidCallback? onTap;
  final IconData? openIcon;
  final ScrollController scrollController;
  final String title;

  @override
  State<StatefulWidget> createState() => _ScrollReactiveFabButtonState();
}

class _ScrollReactiveFabButtonState extends State<ScrollReactiveFabButton> {
  bool isFabVisible = true;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isFabVisible == true) {
          if (mounted) setState(() => isFabVisible = false);
        }
      } else {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isFabVisible == false) {
            if (mounted) setState(() => isFabVisible = true);
          }
        }
      }
    });
  }

  Widget _child(VoidCallback? action) {
    return FloatingActionButton.extended(
      key: const Key('ScrollReactiveFabButtonKey'),
      onPressed: action,
      extendedPadding: (!isFabVisible && widget.hide) ? EdgeInsets.zero : null,
      elevation: (!isFabVisible && widget.hide) ? 0 : null,
      label: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            FadeTransition(
          opacity: animation.drive(CurveTween(curve: Curves.easeOutQuint)),
          child: SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            child: child,
          ),
        ),
        child: !isFabVisible
            ? widget.hide
                ? const SizedBox.shrink()
                : Icon(widget.closedIcon ?? Icons.add)
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(widget.openIcon ?? Icons.create_rounded),
                  ),
                  Text(widget.title),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (widget.openBuilder != null) {
      child = OpenContainer(
        useRootNavigator: true,
        // important for back on case save
        openBuilder: widget.openBuilder!,
        openColor: Theme.of(context).colorScheme.surface,
        closedColor: Colors.transparent,
        closedElevation: 0,
        tappable: false,
        closedBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 4, left: 8),
            child: _child(action),
          );
        },
      );
    } else if (widget.onTap != null) {
      child = GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, right: 4, left: 8),
          child: _child(null),
        ),
      );
    } else {
      child = const Icon(Icons.error);
    }

    /// Make the button move down a little to compensate for padding for shadows
    return Container(
      transform: Matrix4.translationValues(8, 12, 0),
      child: child,
    );
  }
}
