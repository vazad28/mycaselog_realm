import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import 'onboarding_content.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    required this.content,
    super.key,
  });

  final OnboardingContent content;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final child = orientation == Orientation.portrait
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// for some reason the text align left does not work
              Text(
                content.title,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                content.description,
                style: Theme.of(context).textTheme.titleMedium,
                softWrap: true,
              ),
              const SizedBox(height: AppSpacing.xlg),
              Expanded(
                child: FittedBox(child: content.illustration),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// for some reason the text align left does not work
                    Text(
                      content.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content.description,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 96,
                height: 96,
                child: FittedBox(child: content.illustration),
              ),
            ],
          );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ColoredBox(
        color: context.colorScheme.primaryContainer,
        child: child.paddingAll(AppSpacing.xlg),
      ),
    );
  }
}
