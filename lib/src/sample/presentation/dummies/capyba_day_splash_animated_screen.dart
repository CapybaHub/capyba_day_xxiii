import 'package:capyba_day_xxiii/src/sample/presentation/widgets/capybara.dart';
import 'package:capyba_day_xxiii/src/sample/presentation/widgets/static_splash_stack.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/tokens/color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CapybaDaySplashAnimatedScreen extends StatefulWidget {
  const CapybaDaySplashAnimatedScreen({super.key});

  @override
  State<CapybaDaySplashAnimatedScreen> createState() =>
      _CapybaDaySplashAnimatedScreenState();
}

class _CapybaDaySplashAnimatedScreenState
    extends State<CapybaDaySplashAnimatedScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => _controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashAnimation(
        controller: _controller,
        viewportSize: MediaQuery.of(context).size,
      ),
    );
  }
}

class SplashAnimation extends StatelessWidget {
  SplashAnimation({
    super.key,
    required this.controller,
    required this.viewportSize,
  })  : greyHeight = Tween<double>(
          begin: viewportSize.height,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0,
              0.250,
              curve: Curves.easeInOutCubic,
            ),
          ),
        ),
        purpleHeight = Tween<double>(
          begin: 0,
          end: viewportSize.height,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.150,
              0.350,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        capybaraPadding = EdgeInsetsTween(
          begin: EdgeInsets.only(top: 48),
          end: EdgeInsets.zero,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.22,
              0.350,
              curve: Curves.easeIn,
            ),
          ),
        ),
        stackOpacity = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        stackTopPosition = Tween<double>(
          begin: (viewportSize.height - 113) / 2 + 48,
          end: (viewportSize.height - 113) / 2,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        capybaraSizeFactor = Tween<double>(
          begin: 1,
          end: 92 / 191.7,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        ), capybaraHorizontalPosition = Tween<double>(
          begin: 62,
          end: 17,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        ), capybaraVerticalPosition = Tween<double>(
          begin: 0,
          end: 63,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1,
              curve: Curves.easeInOut,
            ),
          ),
        );

  final AnimationController controller;
  final Size viewportSize;
  final Animation<double> greyHeight;
  final Animation<double> purpleHeight;
  final Animation<EdgeInsets> capybaraPadding;
  final Animation<double> stackOpacity;
  final Animation<double> stackTopPosition;
  final Animation<double> capybaraSizeFactor;
  final Animation<double> capybaraHorizontalPosition;
  final Animation<double> capybaraVerticalPosition;
  

  @override
  Widget build(BuildContext context) {
    // timeDilation = 5;
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        Container(
          width: viewportSize.width,
          height: viewportSize.height,
          color: ColorTokens.capybaDayPurple,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: stackOpacity.value,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: stackTopPosition.value,
                      child: StaticSplashStack(
                        withCapybara: false,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.value > 0.25,
                child: Padding(
                  padding: capybaraPadding.value,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 308,
                        height: 191.7,
                      ),
                      Positioned(
                        right: capybaraHorizontalPosition.value,
                        top: capybaraVerticalPosition.value,
                        child: Capybara(
                          height: 191.7 * capybaraSizeFactor.value,
                          width: 184.41 * capybaraSizeFactor.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              height: greyHeight.value,
              width: viewportSize.width,
              color: ColorTokens.capybaDayGray,
            ),
            Expanded(
              child: Container(
                width: viewportSize.width,
                color: ColorTokens.capybaDayPink,
              ),
            ),
            Expanded(
              child: Container(
                width: viewportSize.width,
                color: ColorTokens.capybaDayYellow,
              ),
            ),
            Container(
              height: purpleHeight.value,
              width: viewportSize.width,
              color: Colors.transparent,
            ),
          ],
        ),
      ],
    );
  }
}
