import 'package:flutter_base/src/sample/domain/usecases/sample_usecase/sample_usecase.dart';
import 'package:flutter_base/src/shared/shared_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleProviders {
  static AutoDisposeProvider<SampleUsecase> sampleUsecaseProvider =
      AutoDisposeProvider(
    (ref) => SampleUsecase(
      apiRepository: ref.read(SharedProviders.apiRepositoryProvider.notifier),
    ),
  );
}
