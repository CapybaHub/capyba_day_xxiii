import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:capyba_day_xxiii/src/router/app_router.gr.dart';
import 'package:capyba_day_xxiii/src/sample/domain/usecases/sample_usecase/sample_usecase.dart';
import 'package:capyba_day_xxiii/src/sample/sample_providers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleSmartView extends ConsumerWidget {
  const SampleSmartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocConsumer<SampleUsecase, SampleState>(
      bloc: ref.watch(SampleProviders.sampleUsecaseProvider)
        ?..add(const SampleEvent.started()),
      listener: _listener,
      buildWhen: (previous, current) => current.flow != previous.flow,
      builder: (context, state) => WillPopScope(
        onWillPop: () async => false,
        child: AutoRouter.declarative(
          routes: (PendingRoutesHandler handler) => _routes(handler, state),
        ),
      ),
    );
  }

  _routes(PendingRoutesHandler handler, SampleState state) {
    return state.flow.when(
      splash: () => const [SampleSplashRouteWrapper()],
      login: () => const [SampleLoginRouteWrapper()],
      home: () => const [SampleHomeRouteWrapper()],
    );
  }

  void _listener(BuildContext context, SampleState state) {}
}
