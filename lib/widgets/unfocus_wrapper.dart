import 'package:flutter/material.dart';

class UnfocusWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const UnfocusWrapper({required this.child, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
        onTap?.call();
      },
      child: child,
    );
  }
}
