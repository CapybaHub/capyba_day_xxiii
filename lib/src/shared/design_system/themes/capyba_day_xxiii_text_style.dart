import 'package:flutter/material.dart';
import 'package:capyba_day_xxiii/src/shared/design_system/tokens/typography_tokens.dart';

@immutable
class CapybaDayXxiiiTextStyle {
  final TextStyle style;
  const CapybaDayXxiiiTextStyle._(this.style);
  static CapybaDayXxiiiTextStyle headline1 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.weka,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.deka,
    ),
  );
  static CapybaDayXxiiiTextStyle headline2 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.yotta,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.hecto,
    ),
  );
  static CapybaDayXxiiiTextStyle headline3 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.zetta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.kilo,
    ),
  );
  static CapybaDayXxiiiTextStyle headline4 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.exa,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.tera,
    ),
  );
  static CapybaDayXxiiiTextStyle headline5 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.peta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.kilo,
    ),
  );
  static CapybaDayXxiiiTextStyle headline6 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.giga,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.giga,
    ),
  );
  static CapybaDayXxiiiTextStyle headline7 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.giga,
      fontWeight: FontWeightTokens.light,
      letterSpacing: LetterSpacingTokens.giga,
    ),
  );
  static CapybaDayXxiiiTextStyle subtitle1 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.zetta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.giga,
    ),
  );
  static CapybaDayXxiiiTextStyle subtitle2 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.zetta,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.mega,
    ),
  );
  static CapybaDayXxiiiTextStyle bodyText1 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.mega,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.exa,
    ),
  );
  static CapybaDayXxiiiTextStyle bodyText2 = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.kilo,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.tera,
    ),
  );
  static CapybaDayXxiiiTextStyle button = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.kilo,
      fontWeight: FontWeightTokens.bold,
      letterSpacing: LetterSpacingTokens.exa,
    ),
  );
  static CapybaDayXxiiiTextStyle caption = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.hecto,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.peta,
    ),
  );
  static CapybaDayXxiiiTextStyle overline = const CapybaDayXxiiiTextStyle._(
    TextStyle(
      fontSize: FontSizeTokens.deka,
      fontWeight: FontWeightTokens.regular,
      letterSpacing: LetterSpacingTokens.yotta,
    ),
  );
  CapybaDayXxiiiTextStyle get weightLight => CapybaDayXxiiiTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.light));
  CapybaDayXxiiiTextStyle get weightRegular => CapybaDayXxiiiTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.regular));
  CapybaDayXxiiiTextStyle get weightBold => CapybaDayXxiiiTextStyle._(
      style.copyWith(fontWeight: FontWeightTokens.bold));
}
