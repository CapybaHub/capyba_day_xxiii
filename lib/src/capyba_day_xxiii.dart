import 'package:flutter/material.dart';
import 'package:capyba_day_xxiii/src/router/app_router_providers.dart';
import 'package:capyba_day_xxiii/src/shared/data/miscelaneous/env.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/capyba_day_xxiii_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CapybaDayXxiii extends ConsumerWidget {
  const CapybaDayXxiii({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'CapybaDayXxiii',
      theme: CapybaDayXxiiiTheme.data(context),
      routerConfig: ref.watch(AppRouterProviders.appRouterProvider).config(),
      builder: (context, child) => Env.name != Envs.PRODUCTION
          ? Env.name.isNotEmpty
              ? Banner(
                  message: Env.name.toString(),
                  textDirection: TextDirection.ltr,
                  location: BannerLocation.topStart,
                  child: child,
                )
              : Banner(
                  message: "ENVLESS",
                  textDirection: TextDirection.ltr,
                  location: BannerLocation.topStart,
                  child: child,
                )
          : child!,
    );
  }
}
