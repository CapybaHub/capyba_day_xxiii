import 'package:flutter/material.dart';
import 'package:capyba_day_xxiii/src/sample/domain/usecases/sample_usecase/sample_usecase.dart';
import 'package:capyba_day_xxiii/src/sample/sample_providers.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/assets/capyba_day_xxiii_images.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/themes/app_button_color.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/themes/capyba_day_xxiii_text_style.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/widgets/buttons/capyba_day_xxiii_outline_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleHomeScreen extends ConsumerWidget {
  const SampleHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              CircleAvatar(
                radius: SpacingTokens.exa,
                child: Image.asset(
                  CapybaDayXxiiiImages.defaultAvatar,
                ),
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingTokens.mega,
                  ),
                  child: ListView(
                    children: [
                      Text(
                        "This is the Capyba Flutter Base sample App.",
                        style: CapybaDayXxiiiTextStyle.bodyText1.style,
                      ),
                      const SizedBox(
                        height: SpacingTokens.mega,
                      ),
                      Text(
                        "* Remember that this is still running with no environment distiction. That's a good place to start.",
                        style: CapybaDayXxiiiTextStyle.bodyText2.style,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: SpacingTokens.mega,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingTokens.mega,
                ),
                child: CapybaDayXxiiiOutlineButton(
                  "Sair",
                  color: AppButtonColor.outline,
                  onPressed: () => ref
                      .read(SampleProviders.sampleUsecaseProvider)
                      .add(const SampleEvent.started()),
                ),
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
}
