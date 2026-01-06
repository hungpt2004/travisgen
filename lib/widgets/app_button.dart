import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travisgen_client/common/theme/app_size.dart';
import 'package:travisgen_client/common/theme/color.dart';

class AppButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Widget? prefix;
  final double iconSize;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final Color borderColor;
  final double height;
  final double borderRadius;
  final double? borderWidth;
  final bool isDisabled;
  final double width;

  const AppButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textStyle,
    this.prefix,
    this.iconSize = 24.0,
    this.padding,
    this.backgroundColor = AppColor.primaryBlue,
    this.disabledBackgroundColor,
    this.borderColor = Colors.transparent,
    this.height = AppSize.s56,
    this.borderRadius = AppSize.s56,
    this.borderWidth,
    this.isDisabled = false,
    this.width = 320,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
      backgroundColor: isDisabled ? disabledBackgroundColor ?? Colors.black.withValues(alpha: 0.1) : backgroundColor,
        minimumSize: Size(width.w, height.h),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDisabled ? disabledBackgroundColor ?? Colors.black.withValues(alpha: 0.1) : borderColor,
            width: borderWidth ?? 0.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: isDisabled
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onPressed();
            },
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSize.s16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [if (prefix != null) prefix!, text],
        ),
      ),
    );
  }
}
