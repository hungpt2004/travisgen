import 'package:flutter/material.dart';

abstract class DialogUtil {
  static bool _isDialogOpen = false;

  static void hideLoading(BuildContext context) {
    if (!_isDialogOpen) {
      return;
    }

    _isDialogOpen = false;
    Navigator.of(context).pop();
  }

  static void showLoading(BuildContext context) {
    if (_isDialogOpen) {
      return;
    }
    _isDialogOpen = true;

    Navigator.of(context).push(
      CustomPopupRoute<dynamic>(
        child: const PopScope(
          canPop: false,
          child: Center(child: RefreshProgressIndicator(backgroundColor: Colors.white, color: Colors.blue)),
        ),
        barrierDismissible: false,
      ),
    );
  }
}

class CustomPopupRoute<T> extends PopupRoute<T> {
  CustomPopupRoute({
    required this.child,
    Color barrierColor = const Color(0x80000000),
    bool barrierDismissible = true,
    String? barrierLabel,
    Duration transitionDuration = const Duration(milliseconds: 200),
    this.useSafeArea = true,
  }) : _barrierColor = barrierColor,
       _barrierDismissible = barrierDismissible,
       _barrierLabel = barrierLabel,
       _transitionDuration = transitionDuration;

  final Widget child;
  final Color _barrierColor;
  final bool _barrierDismissible;
  final String? _barrierLabel;
  final Duration _transitionDuration;
  final bool useSafeArea;

  @override
  Color? get barrierColor => _barrierColor;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  Duration get transitionDuration => _transitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Semantics(scopesRoute: true, explicitChildNodes: true, child: useSafeArea ? SafeArea(child: child) : child);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.linear), child: child);
  }
}
