import 'package:capyba_day_xxiii/src/shared/design_system/assets/capyba_day_xxiii_images.dart';
import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  const Day({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CapybaDayXxiiiImages.day,
      width: 100.92,
      height: 48.86,
    );
  }
}
