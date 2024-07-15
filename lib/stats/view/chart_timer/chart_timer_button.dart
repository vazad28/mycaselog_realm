part of './chart_timer.dart';

const double kChartTimerButtonHeight = 36;
const double kChartTimerButtonWidthMonth = 56;
const double kChartTimerButtonWidthYear = 64;

class ChartTimerButton extends StatelessWidget {
  const ChartTimerButton(this.label, {required this.isActive, super.key});

  static const animationCurve = Curves.easeInOut;

  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Widget child = AnimatedContainer(
      duration: kThemeAnimationDuration,
      curve: animationCurve,
      decoration: ShapeDecoration(
        color: isActive ? colorScheme.onPrimary : colorScheme.primary,
        shape: const StadiumBorder(),
        shadows: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 1,
            spreadRadius: 1,
            color: isActive
                ? colorScheme.shadow.withOpacity(0.1)
                : Colors.transparent,
          ),
        ],
      ),
      child: TweenAnimationBuilder<BorderRadius>(
        duration: kThemeAnimationDuration,
        curve: animationCurve,
        tween: Tween(begin: BorderRadius.zero, end: BorderRadius.circular(16)),
        builder: (context, borderRadius, child) => ClipRRect(
          borderRadius: borderRadius,
          child: child,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? colorScheme.primary : colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    return child.paddingAll(4);
  }
}
