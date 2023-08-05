import 'package:convenience_types/convenience_types.dart';
import 'package:capyba_day_xxiii/src/sample/domain/forms/sign_in_form.dart';
import 'package:capyba_day_xxiii/src/shared/data/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sample_state.dart';
part 'sample_event.dart';
part 'sample_usecase.freezed.dart';

class SampleUsecase extends Bloc<SampleEvent, SampleState> {
  final ApiRepository _apiRepository;
  SampleUsecase({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(SampleState.initial()) {
    on<SampleEvent>(
      (event, emit) async {
        await event.map(
          started: (event) => _onStarted(event, emit),
          continuePressed: (event) => _onContinuePressed(event, emit),
        );
      },
    );
  }
  _onStarted(_Started event, Emitter<SampleState> emit) async {
    emit(SampleState.initial());
    await Future.delayed(
      const Duration(milliseconds: 2500),
    );
    emit(state.copyWith(flow: const Login()));
  }

  _onContinuePressed(ContinuePressed event, Emitter<SampleState> emit) async {
    emit(
      state.copyWith(
        signInForm:
            state.signInForm.setEmail(event.email).setPassword(event.password),
        signInRequestStatus: const Loading(),
      ),
    );
    Result<String> signInRes = await _apiRepository.signIn(state.signInForm);
    signInRes.handle(
      onSuccess: (data) {
        emit(state.copyWith(
          signInRequestStatus: Succeeded(data),
          flow: const Home(),
        ));
      },
      onFailure: (error) {
        emit(state.copyWith(signInRequestStatus: Failed(error)));
      },
    );
  }
}
