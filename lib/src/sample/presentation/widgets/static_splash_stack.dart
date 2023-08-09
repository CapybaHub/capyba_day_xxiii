import 'package:capyba_day_xxiii/src/sample/presentation/widgets/capyba.dart';
import 'package:capyba_day_xxiii/src/sample/presentation/widgets/capybara.dart';
import 'package:capyba_day_xxiii/src/sample/presentation/widgets/day.dart';
import 'package:capyba_day_xxiii/src/sample/presentation/widgets/twenty_three.dart';
import 'package:flutter/material.dart';

class StaticSplashStack extends StatelessWidget {
  const StaticSplashStack({
    super.key,
    this.withCapybara = true,
  });

  final bool withCapybara;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(height: 113),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Capyba(),
            SizedBox(width: 7.24),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TwentyThree(),
                SizedBox(height: 9),
              ],
            ),
          ],
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: 117.72,
              height: 113,
            ),
            Positioned(
              top: 21,
              child: withCapybara ? Capybara() : SizedBox(
                height: 92,
                width: 88.5,
              ),
            ),
          ],
        ),
        Positioned(
          top: 21,
          right: 18.04,
          child: Stack(
            children: [
              SizedBox(
                width: 171.92,
                height: 92,
              ),
              Positioned(
                bottom: 4.57,
                child: Day(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
