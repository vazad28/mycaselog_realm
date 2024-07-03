import 'package:flutter/material.dart';

class OnboardingContent {
  OnboardingContent({
    required this.description,
    required this.title,
    required this.illustration,
  });

  final String title;
  final String description;
  final Widget illustration;
}
