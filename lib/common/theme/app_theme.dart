import 'package:flutter/material.dart';
import 'package:travisgen_client/common/theme/palette.dart';
import 'package:travisgen_client/common/theme/text_styles.dart';

final Map<ThemeMode, ThemeSheet> themes = {
  ThemeMode.light: ThemeSheet(palette: Palette.light(), textStyles: AppTextStyles.fromPalette(Palette.light())),
  ThemeMode.dark: ThemeSheet(palette: Palette.dark(), textStyles: AppTextStyles.fromPalette(Palette.dark())),
};

class ThemeSheet {
  final ThemeData themeData;
  final Palette palette;
  final AppTextStyles textStyles;

  ThemeSheet({required this.palette, required this.textStyles})
    : themeData = ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        brightness: palette.brightness,
        scaffoldBackgroundColor: palette.scaffoldBackground,
        extensions: [palette, textStyles],
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        bottomSheetTheme: const BottomSheetThemeData(showDragHandle: false),
      );
}
