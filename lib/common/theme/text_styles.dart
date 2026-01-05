// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travisgen_client/common/theme/palette.dart';

extension on TextStyle {
  TextStyle get w3 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w4 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w5 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w6 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w7 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w8 => copyWith(fontWeight: FontWeight.w800);
}

extension TextStyleExt on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

class Fonts {
  static const TextStyle _defaultTextStyle = TextStyle(fontFamily: 'Inter');
  static TextStyle get defaultTextStyle => _defaultTextStyle;

  static final TextStyle s7w4 = _defaultTextStyle.copyWith(fontSize: 7.sp).w4;
  static final TextStyle s8w4 = _defaultTextStyle.copyWith(fontSize: 8.sp).w4;
  static final TextStyle s8w6 = _defaultTextStyle.copyWith(fontSize: 8.sp).w6;
  static final TextStyle s10w3 = _defaultTextStyle.copyWith(fontSize: 10.sp).w3;
  static final TextStyle s10w4 = _defaultTextStyle.copyWith(fontSize: 10.sp).w4;
  static final TextStyle s10w5 = _defaultTextStyle.copyWith(fontSize: 10.sp).w5;
  static final TextStyle s10w6 = _defaultTextStyle.copyWith(fontSize: 10.sp).w6;
  static final TextStyle s10w7 = _defaultTextStyle.copyWith(fontSize: 10.sp).w7;
  static final TextStyle s11w3 = _defaultTextStyle.copyWith(fontSize: 11.sp).w3;
  static final TextStyle s11w4 = _defaultTextStyle.copyWith(fontSize: 11.sp).w4;
  static final TextStyle s11w5 = _defaultTextStyle.copyWith(fontSize: 11.sp).w5;
  static final TextStyle s11w6 = _defaultTextStyle.copyWith(fontSize: 11.sp).w6;
  static final TextStyle s12w3 = _defaultTextStyle.copyWith(fontSize: 12.sp).w3;
  static final TextStyle s12w4 = _defaultTextStyle.copyWith(fontSize: 12.sp).w4;
  static final TextStyle s12w5 = _defaultTextStyle.copyWith(fontSize: 12.sp).w5;
  static final TextStyle s12w6 = _defaultTextStyle.copyWith(fontSize: 12.sp).w6;
  static final TextStyle s12w7 = _defaultTextStyle.copyWith(fontSize: 12.sp).w7;
  static final TextStyle s13w3 = _defaultTextStyle.copyWith(fontSize: 13.sp).w3;
  static final TextStyle s13w4 = _defaultTextStyle.copyWith(fontSize: 13.sp).w4;
  static final TextStyle s13w5 = _defaultTextStyle.copyWith(fontSize: 13.sp).w5;
  static final TextStyle s14w4 = _defaultTextStyle.copyWith(fontSize: 14.sp).w4;
  static final TextStyle s14w5 = _defaultTextStyle.copyWith(fontSize: 14.sp).w5;
  static final TextStyle s14w6 = _defaultTextStyle.copyWith(fontSize: 14.sp).w6;
  static final TextStyle s14w7 = _defaultTextStyle.copyWith(fontSize: 14.sp).w7;
  static final TextStyle s15w3 = _defaultTextStyle.copyWith(fontSize: 15.sp).w3;
  static final TextStyle s15w4 = _defaultTextStyle.copyWith(fontSize: 15.sp).w4;
  static final TextStyle s15w5 = _defaultTextStyle.copyWith(fontSize: 15.sp).w5;
  static final TextStyle s15w6 = _defaultTextStyle.copyWith(fontSize: 15.sp).w6;
  static final TextStyle s15w7 = _defaultTextStyle.copyWith(fontSize: 15.sp).w7;
  static final TextStyle s15w8 = _defaultTextStyle.copyWith(fontSize: 15.sp).w8;
  static final TextStyle s16w3 = _defaultTextStyle.copyWith(fontSize: 16.sp).w3;
  static final TextStyle s16w4 = _defaultTextStyle.copyWith(fontSize: 16.sp).w4;
  static final TextStyle s16w5 = _defaultTextStyle.copyWith(fontSize: 16.sp).w5;
  static final TextStyle s16w6 = _defaultTextStyle.copyWith(fontSize: 16.sp).w6;
  static final TextStyle s16w7 = _defaultTextStyle.copyWith(fontSize: 16.sp).w7;
  static final TextStyle s17w3 = _defaultTextStyle.copyWith(fontSize: 17.sp).w3;
  static final TextStyle s17w4 = _defaultTextStyle.copyWith(fontSize: 17.sp).w4;
  static final TextStyle s17w5 = _defaultTextStyle.copyWith(fontSize: 17.sp).w5;
  static final TextStyle s17w6 = _defaultTextStyle.copyWith(fontSize: 17.sp).w6;
  static final TextStyle s17w7 = _defaultTextStyle.copyWith(fontSize: 17.sp).w7;
  static final TextStyle s18w3 = _defaultTextStyle.copyWith(fontSize: 18.sp).w3;
  static final TextStyle s18w4 = _defaultTextStyle.copyWith(fontSize: 18.sp).w4;
  static final TextStyle s18w5 = _defaultTextStyle.copyWith(fontSize: 18.sp).w5;
  static final TextStyle s18w6 = _defaultTextStyle.copyWith(fontSize: 18.sp).w6;
  static final TextStyle s18w7 = _defaultTextStyle.copyWith(fontSize: 18.sp).w7;
  static final TextStyle s21w5 = _defaultTextStyle.copyWith(fontSize: 21.sp).w5;
  static final TextStyle s20w5 = _defaultTextStyle.copyWith(fontSize: 20.sp).w5;
  static final TextStyle s20w6 = _defaultTextStyle.copyWith(fontSize: 20.sp).w6;
  static final TextStyle s20w7 = _defaultTextStyle.copyWith(fontSize: 20.sp).w7;
  static final TextStyle s22w6 = _defaultTextStyle.copyWith(fontSize: 22.sp).w6;
  static final TextStyle s24w3 = _defaultTextStyle.copyWith(fontSize: 24.sp).w3;
  static final TextStyle s24w4 = _defaultTextStyle.copyWith(fontSize: 24.sp).w4;
  static final TextStyle s24w5 = _defaultTextStyle.copyWith(fontSize: 24.sp).w5;
  static final TextStyle s24w6 = _defaultTextStyle.copyWith(fontSize: 24.sp).w6;
  static final TextStyle s24w7 = _defaultTextStyle.copyWith(fontSize: 24.sp).w7;
  static final TextStyle s28w7 = _defaultTextStyle.copyWith(fontSize: 28.sp).w7;
  static final TextStyle s30w6 = _defaultTextStyle.copyWith(fontSize: 30.sp).w6;
  static final TextStyle s32w4 = _defaultTextStyle.copyWith(fontSize: 32.sp).w4;
  static final TextStyle s32w5 = _defaultTextStyle.copyWith(fontSize: 32.sp).w5;
  static final TextStyle s32w7 = _defaultTextStyle.copyWith(fontSize: 32.sp).w6;
  static final TextStyle s32w6 = _defaultTextStyle.copyWith(fontSize: 32.sp).w7;
  static final TextStyle s34w4 = _defaultTextStyle.copyWith(fontSize: 34.sp).w4;
  static final TextStyle s48w8 = _defaultTextStyle.copyWith(fontSize: 48.sp).w8;
  static final TextStyle s56w6 = _defaultTextStyle.copyWith(fontSize: 56.sp).w6;
  static final TextStyle s76w8 = _defaultTextStyle.copyWith(fontSize: 76.sp).w8;
}

@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  /// s32w7
  final TextStyle heading1;

  // Text field
  final TextStyle placeholder;
  final TextStyle textfield;
  final TextStyle errorTextField;
  final TextStyle passwordStrengthIndicator;

  final TextStyle appBarTitle;

  final TextStyle button;

  final TextStyle sectionTitle;
  final TextStyle exploreMore;
  final TextStyle dividerCap;
  final TextStyle hintTextField;
  final TextStyle dividerSmallCap;

  final TextStyle noItemsFound;

  const AppTextStyles({
    required this.heading1,
    required this.placeholder,
    required this.textfield,
    required this.errorTextField,
    required this.passwordStrengthIndicator,
    required this.button,
    required this.appBarTitle,
    required this.sectionTitle,
    required this.exploreMore,
    required this.dividerCap,
    required this.hintTextField,
    required this.dividerSmallCap,
    required this.noItemsFound,
  });

  factory AppTextStyles.fromPalette(Palette palette) {
    return AppTextStyles(
      heading1: Fonts.s32w7,
      placeholder: Fonts.s14w4.withColor(palette.placeholder),
      textfield: Fonts.s16w4.withColor(palette.primaryText),
      errorTextField: Fonts.s10w4.withColor(palette.error),
      passwordStrengthIndicator: Fonts.s12w4.withColor(Colors.grey),
      button: Fonts.s17w7.withColor(Colors.white),
      appBarTitle: Fonts.s18w7.withColor(Colors.black),
      sectionTitle: Fonts.s18w7.withColor(palette.primaryText),
      exploreMore: Fonts.s12w4.withColor(Colors.blueAccent),
      dividerCap: Fonts.s16w4.withColor(palette.primaryText),
      hintTextField: Fonts.s16w4.withColor(Colors.grey),
      dividerSmallCap: Fonts.s12w4.withColor(palette.primaryText),
      noItemsFound: Fonts.s16w4.withColor(palette.primaryText),
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles || identical(this, other)) {
      return this;
    }

    return AppTextStyles(
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      placeholder: TextStyle.lerp(placeholder, other.placeholder, t)!,
      textfield: TextStyle.lerp(textfield, other.textfield, t)!,
      errorTextField: TextStyle.lerp(errorTextField, other.errorTextField, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      passwordStrengthIndicator: TextStyle.lerp(passwordStrengthIndicator, other.passwordStrengthIndicator, t)!,
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      sectionTitle: TextStyle.lerp(sectionTitle, other.sectionTitle, t)!,
      exploreMore: TextStyle.lerp(exploreMore, other.exploreMore, t)!,
      dividerCap: TextStyle.lerp(dividerCap, other.dividerCap, t)!,
      hintTextField: TextStyle.lerp(hintTextField, other.hintTextField, t)!,
      dividerSmallCap: TextStyle.lerp(dividerSmallCap, other.dividerSmallCap, t)!,
      noItemsFound: TextStyle.lerp(noItemsFound, other.noItemsFound, t)!,
    );
  }

  @override
  AppTextStyles copyWith({
    TextStyle? heading1,
    TextStyle? placeholder,
    TextStyle? textfield,
    TextStyle? errorTextField,
    TextStyle? button,
    TextStyle? passwordStrengthIndicator,
    TextStyle? appBarTitle,
    TextStyle? sectionTitle,
    TextStyle? exploreMore,
    TextStyle? dividerCap,
    TextStyle? hintTextField,
    TextStyle? dividerSmallCap,
    TextStyle? noItemsFound,
  }) {
    return AppTextStyles(
      heading1: heading1 ?? this.heading1,
      placeholder: placeholder ?? this.placeholder,
      textfield: textfield ?? this.textfield,
      errorTextField: errorTextField ?? this.errorTextField,
      button: button ?? this.button,
      passwordStrengthIndicator: passwordStrengthIndicator ?? this.passwordStrengthIndicator,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      exploreMore: exploreMore ?? this.exploreMore,
      dividerCap: dividerCap ?? this.dividerCap,
      hintTextField: hintTextField ?? this.hintTextField,
      dividerSmallCap: dividerSmallCap ?? this.dividerSmallCap,
      noItemsFound: noItemsFound ?? this.noItemsFound,
    );
  }
}
