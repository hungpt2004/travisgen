// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  final Brightness brightness;

  // Background colors
  final Color scaffoldBackground;

  // Text field
  final Color placeholder;

  // Status colors
  final Color success;
  final Color error;

  // Text colors
  final Color primaryText;

  // Button colors
  final Color authButtonBackground;

  // Divider colors
  final Color divider;

  // Link colors
  final Color link;

  // Club profile
  final Color actionButtonBackground;

  final Color secondaryBackground;

  final Color borderColor;

  Palette({
    required this.brightness,
    required this.actionButtonBackground,
    this.scaffoldBackground = const Color(0xFFFFFFFF),
    this.placeholder = const Color(0xFF808089),
    this.success = const Color(0xFF10B981),
    this.error = const Color(0xFFF20000),
    this.primaryText = const Color(0xFF111827),
    this.authButtonBackground = const Color(0xFFD2F46F),
    this.divider = const Color(0xFF6B7280),
    this.link = const Color(0xFF4A90E2),
    this.secondaryBackground = const Color(0xFFF5F4F7),
    this.borderColor = const Color(0xFF6B7280),
  });

  factory Palette.light() {
    return Palette(brightness: Brightness.light, actionButtonBackground: Colors.white.withValues(alpha: 0.7));
  }

  factory Palette.dark() {
    return Palette(
      brightness: Brightness.dark,
      scaffoldBackground: const Color(0xFF3A3A3A),
      authButtonBackground: const Color(0xFF424242),
      link: const Color(0xFF64B5F6),
      actionButtonBackground: const Color(0xFF1A1A1A).withValues(alpha: 0.7),
    );
  }

  @override
  ThemeExtension<Palette> lerp(covariant ThemeExtension<Palette>? other, double t) {
    if (other is! Palette || identical(this, other)) {
      return this;
    }

    return Palette(
      brightness: brightness,
      scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      placeholder: Color.lerp(placeholder, other.placeholder, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      authButtonBackground: Color.lerp(authButtonBackground, other.authButtonBackground, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      link: Color.lerp(link, other.link, t)!,
      actionButtonBackground: Color.lerp(actionButtonBackground, other.actionButtonBackground, t)!,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  Palette copyWith({
    Brightness? brightness,
    Color? scaffoldBackground,
    Color? placeholder,
    Color? success,
    Color? error,
    Color? textPrimary,
    Color? buttonBackground,
    Color? buttonText,
    Color? divider,
    Color? link,
    Color? actionButtonBackground,
    Color? secondaryBackground,
    Color? primary,
    Color? secondary,
    Color? border,
    Color? bookingCardSecondaryBackground,
    Color? socialButtonBg,
    Color? buttonDisabled,
    Color? buttonDisabledText,
    Color? borderColor,
  }) {
    return Palette(
      brightness: brightness ?? this.brightness,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      placeholder: placeholder ?? this.placeholder,
      success: success ?? this.success,
      error: error ?? this.error,
      primaryText: textPrimary ?? primaryText,
      authButtonBackground: buttonBackground ?? authButtonBackground,
      divider: divider ?? this.divider,
      link: link ?? this.link,
      actionButtonBackground: actionButtonBackground ?? this.actionButtonBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}
