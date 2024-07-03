import 'package:app_assets/app_assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.size = const Size(300, 300), super.key});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(size),
        child: Assets.logo.appLogoIcon.image(
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
