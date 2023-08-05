import 'package:flutter/material.dart';
import 'package:flutter_base/src/router/app_router_providers.dart';
import 'package:flutter_base/src/shared/data/miscelaneous/env.dart';
import 'package:flutter_base/src/shared/design_system/flutter_base_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlutterBase extends ConsumerWidget {
  const FlutterBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'FlutterBase',
      theme: FlutterBaseTheme.data(context),
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
