import 'package:flutter/material.dart';
import 'package:flutter_base/src/sample/domain/usecases/sample_usecase/sample_usecase.dart';
import 'package:flutter_base/src/sample/sample_providers.dart';
import 'package:flutter_base/src/shared/design_system/themes/flutter_base_text_style.dart';
import 'package:flutter_base/src/shared/design_system/tokens/color_tokens.dart';
import 'package:flutter_base/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:flutter_base/src/shared/design_system/widgets/buttons/flutter_base_button.dart';
import 'package:flutter_base/src/shared/design_system/widgets/flutter_base_circular_progress_indicator.dart';
import 'package:flutter_base/src/shared/design_system/widgets/hero_app_name.dart';
import 'package:flutter_base/src/shared/design_system/widgets/text_field/flutter_base_text_field.dart';
import 'package:flutter_base/src/shared/design_system/widgets/text_field/flutter_base_text_field_controller.dart';
import 'package:flutter_base/src/shared/presentation/widgets/flexible_scroll_container.dart';
import 'package:flutter_base/src/shared/utils/hooks/flutter_base_text_controller_hook.dart';
import 'package:flutter_base/src/shared/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleLoginScreen extends HookConsumerWidget {
  const SampleLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useFlutterBaseTextFieldController(
      validators: Validators.password,
    );

    final emailController = useFlutterBaseTextFieldController(
      validators: Validators.email,
    );

    final passwordFocus = useFocusNode();

    return Scaffold(
      backgroundColor: ColorTokens.neutralLightest,
      body: FlexibleScrollContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingTokens.giga,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroAppName(),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Enter your ",
                      style: FlutterBaseTextStyle.bodyText1.style
                          .copyWith(color: ColorTokens.neutralMediumDark),
                    ),
                    TextSpan(
                      text: "Email:",
                      style: FlutterBaseTextStyle.bodyText1.weightBold.style
                          .copyWith(
                        color: ColorTokens.neutralDarkest,
                      ),
                    )
                  ],
                ),
              ),
              FlutterBaseTextField(
                hintText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (value) => passwordFocus.requestFocus(),
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Enter your ",
                      style: FlutterBaseTextStyle.bodyText1.style
                          .copyWith(color: ColorTokens.neutralMediumDark),
                    ),
                    TextSpan(
                      text: "Password:",
                      style: FlutterBaseTextStyle.bodyText1.weightBold.style
                          .copyWith(
                        color: ColorTokens.neutralDarkest,
                      ),
                    )
                  ],
                ),
              ),
              FlutterBaseTextField(
                hintText: "Password",
                focusNode: passwordFocus,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                onSubmitted: (value) => _onContinuePressed(
                  emailController: emailController,
                  passwordController: passwordController,
                  ref: ref,
                ),
                suffix: SUFFIX.Eye,
              ),
              const SizedBox(
                height: SpacingTokens.exa,
              ),
              BlocBuilder<SampleUsecase, SampleState>(
                bloc: ref.read(SampleProviders.sampleUsecaseProvider),
                builder: (context, state) {
                  return Column(
                    children: [
                      state.signInRequestStatus.isLoading
                          ? const FlutterBaseCircularProgressIndicator()
                          : const SizedBox(),
                      Visibility(
                        visible: state.signInRequestStatus.isLoading,
                        child: const SizedBox(
                          height: SpacingTokens.mega,
                        ),
                      ),
                      FlutterBaseButton(
                        text: "Continue",
                        onPressed: state.signInRequestStatus.isLoading
                            ? null
                            : () => _onContinuePressed(
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  ref: ref,
                                ),
                      )
                    ],
                  );
                },
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onContinuePressed({
    required FlutterBaseTextFieldController emailController,
    required FlutterBaseTextFieldController passwordController,
    required WidgetRef ref,
  }) {
    emailController.showValidationState();
    passwordController.showValidationState();

    if (emailController.isValid && passwordController.isValid) {
      ref.read(SampleProviders.sampleUsecaseProvider).add(ContinuePressed(
          emailController.value.text, passwordController.value.text));
    }
  }
}
