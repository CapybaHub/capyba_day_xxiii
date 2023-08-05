import 'package:capyba_day_xxiii/src/shared/design_system/assets/capyba_day_xxiii_images.dart';
import 'package:flutter/material.dart';

class Capybara extends StatelessWidget {
  const Capybara({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CapybaDayXxiiiImages.capybara,
      width: 88.50,
      height: 92,
    );
  }
}
