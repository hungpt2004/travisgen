import 'package:flutter/material.dart';
import 'package:travisgen_client/common/constant/env.dart';
import 'package:travisgen_client/common/extension/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  static Future<void> openLink(String url) async {
    final uri = Uri.parse(url);

    try {
      await launchUrl(uri);
    } catch (_) {}
  }

  static Future<T?> showSheet<T>(BuildContext context, WidgetBuilder builder) {
    FocusManager.instance.primaryFocus?.unfocus();

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.palette.scaffoldBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: builder,
    );
  }

  static String getAvatarUrl(String avatarId) {
    return '${Env.baseUrl}?key=$avatarId&method=get&namespace=media';
  }
}
