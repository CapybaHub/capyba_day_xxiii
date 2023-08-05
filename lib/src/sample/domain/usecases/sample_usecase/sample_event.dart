part of 'sample_usecase.dart';

@freezed
class SampleEvent with _$SampleEvent {
  const factory SampleEvent.started() = _Started;
  const factory SampleEvent.continuePressed(String email, String password) =
      ContinuePressed;
}
