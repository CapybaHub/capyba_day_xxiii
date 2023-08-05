import 'package:capyba_day_xxiii/src/shared/design_system/assets/capyba_day_xxiii_images.dart';
import 'package:flutter/material.dart';

class Capyba extends StatelessWidget {
  const Capyba({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CapybaDayXxiiiImages.capyba,
      width: 183.13,
      height: 48.33,
    );
  }
}
