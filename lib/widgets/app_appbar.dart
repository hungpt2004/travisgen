import 'package:flutter/material.dart';
import 'package:travisgen_client/common/extension/context_extension.dart';

class CommonAppBar extends AppBar {
  CommonAppBar(
    BuildContext context, {
    required String title,
    super.key,
    super.actions,
    Color? backgroundColor,
    TextStyle? titleStyle,
    VoidCallback? onBackPressed,
  }) : super(
         title: Text(title, style: titleStyle ?? context.textStyles.appBarTitle),
         centerTitle: true,
         backgroundColor: backgroundColor ?? context.palette.scaffoldBackground,
         elevation: 0,
         surfaceTintColor: backgroundColor ?? context.palette.scaffoldBackground,
         leading: IconButton(
           onPressed: () {
             Navigator.of(context).pop();
             onBackPressed?.call();
           },
           icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
         ),
       );
}
