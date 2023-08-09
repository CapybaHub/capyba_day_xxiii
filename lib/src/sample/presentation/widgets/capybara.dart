import 'package:capyba_day_xxiii/src/shared/design_system/assets/capyba_day_xxiii_images.dart';
import 'package:flutter/material.dart';

class Capybara extends StatelessWidget {
  const Capybara({
    super.key,
    this.height = 92,
    this.width = 88.50,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CapybaDayXxiiiImages.capybara,
      width: width,
      height: height,
    );
  }
}
