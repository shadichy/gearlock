import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension on Scheme {
  ColorScheme toColorScheme(Brightness brightness) => ColorScheme(
      brightness: brightness,
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      error: Color(error),
      onError: Color(onError),
      background: Color(background),
      onBackground: Color(onBackground),
      surface: Color(surface),
      onSurface: Color(onSurface));
}

@immutable
class CoreTheme extends ThemeExtension<CoreTheme> {
  final Color primaryColor, tertiaryColor, neutralColor;

  const CoreTheme({
    required this.primaryColor,
    required this.tertiaryColor,
    required this.neutralColor,
  });

  ThemeData toThemeData() {
    final colorScheme = _scheme().toColorScheme(Brightness.light);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }

  @override
  ThemeExtension<CoreTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      CoreTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  ThemeExtension<CoreTheme> lerp(
    covariant ThemeExtension<CoreTheme>? other,
    double t,
  ) =>
      (other is! CoreTheme)
          ? this
          : CoreTheme(
              primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
              tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
              neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
            );

  ThemeData _base(ColorScheme colorScheme) {
    final primaryTextTheme = GoogleFonts.cantarellTextTheme();
    final secondaryTextTheme = GoogleFonts.comfortaaTextTheme();
    final textTheme = primaryTextTheme.copyWith(
        displaySmall: secondaryTextTheme.displaySmall);
    final isLight = colorScheme.brightness == Brightness.light;
    return ThemeData(
      // textTheme: textTheme,
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
    );
  }

  Scheme _scheme() {
    final basePalette = CorePalette.of(primaryColor.value);
    final primary = basePalette.primary;
    final secondary = basePalette.secondary;
    final error = basePalette.error;
    final tertiary = CorePalette.of(tertiaryColor.value).primary;
    final neutral = CorePalette.of(neutralColor.value).neutral;
    final neutralAlt = basePalette.neutralVariant;
    return Scheme(
      primary: primary.get(40),
      onPrimary: primary.get(100),
      primaryContainer: primary.get(90),
      onPrimaryContainer: primary.get(10),
      secondary: secondary.get(40),
      onSecondary: secondary.get(100),
      secondaryContainer: secondary.get(90),
      onSecondaryContainer: secondary.get(10),
      tertiary: tertiary.get(40),
      onTertiary: tertiary.get(100),
      tertiaryContainer: tertiary.get(90),
      onTertiaryContainer: tertiary.get(10),
      error: error.get(40),
      onError: error.get(100),
      errorContainer: error.get(90),
      onErrorContainer: error.get(10),
      background: neutral.get(99),
      onBackground: neutral.get(10),
      surface: neutral.get(99),
      onSurface: neutral.get(10),
      surfaceVariant: neutralAlt.get(90),
      onSurfaceVariant: neutralAlt.get(30),
      outline: neutralAlt.get(50),
      outlineVariant: neutralAlt.get(80),
      shadow: neutral.get(0),
      scrim: neutral.get(0),
      inverseSurface: neutral.get(20),
      inverseOnSurface: neutral.get(95),
      inversePrimary: primary.get(80),
    );
  }
}
