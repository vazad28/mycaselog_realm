import 'package:app_assets/app_assets.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../onboarding.dart';
import 'onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _selctedIndex = 0;
  late final PageController pageController;

  ColorFilter get colorFilter => ColorFilter.mode(
        Theme.of(context).colorScheme.secondary,
        BlendMode.srcIn,
      );

  List<OnboardingContent> get onBoardingContent => [
        OnboardingContent(
          illustration: Assets.onboarding.surgeon.svg(colorFilter: colorFilter),
          title: 'surgeons',
          description: 'Keep a log of surgeries and much more',
        ),
        OnboardingContent(
          illustration: Assets.onboarding.records.svg(colorFilter: colorFilter),
          title: 'templated details',
          description: 'Use templates to create surgery specific records',
        ),
        OnboardingContent(
          illustration:
              Assets.onboarding.takePhotos.svg(colorFilter: colorFilter),
          title: 'follow up',
          description: 'Easily create follow up records with photos or notes',
        ),
        OnboardingContent(
          illustration:
              Assets.onboarding.barChart.svg(colorFilter: colorFilter),
          title: 'statistics',
          description: 'View your surgery volume with charts',
        ),
      ];

  @override
  void initState() {
    pageController = PageController(viewportFraction: .8, keepPage: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              S.of(context).welcomeToMycaselog,
              style: context.textTheme.headlineLarge,
            ).paddingOnly(bottom: AppSpacing.sm),
            Text(
              'An app for surgeons',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppSpacing.md,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardingContent.length,
                onPageChanged: (value) {
                  setState(() {
                    _selctedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingView(content: onBoardingContent[index])
                      .paddingAll(AppSpacing.lg);
                },
              ),
            ),

            /// Animated Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingContent.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child:
                      OnboardingAnimatedDot(isActive: _selctedIndex == index),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
      floatingActionButton: const OnboardingDoneButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
