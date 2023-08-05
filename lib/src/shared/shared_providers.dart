import 'package:dio/dio.dart';
import 'package:capyba_day_xxiii/src/shared/data/repositories/api_repository.dart';
import 'package:capyba_day_xxiii/src/shared/domain/models/api_state_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedProviders {
  static final Provider<Dio> httpClientProvider = Provider(
    (ref) => Dio(),
  );
  static final StateNotifierProvider<ApiRepository, ApiState>
      apiRepositoryProvider = StateNotifierProvider(
    (ref) => ApiRepository(
      httpClient: ref.watch(SharedProviders.httpClientProvider),
    ),
  );
}
