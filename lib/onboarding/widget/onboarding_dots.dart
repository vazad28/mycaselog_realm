import 'package:flutter/material.dart';

class OnboardingAnimatedDot extends StatelessWidget {
  const OnboardingAnimatedDot({
    required this.isActive, super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        color: isActive
            ? colorScheme.primary
            : colorScheme.onSurface.withOpacity(0.05),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
