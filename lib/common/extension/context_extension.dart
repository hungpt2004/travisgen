import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travisgen_client/app/cubit/app_cubit.dart';
import 'package:travisgen_client/common/theme/palette.dart';
import 'package:travisgen_client/common/theme/text_styles.dart';

extension ContextExtension on BuildContext {
  /// The same of [MediaQuery.of(context).size]
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;

  double get width => mediaQuerySize.width;

  ThemeData get theme => Theme.of(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).viewPadding;

  double get paddingBottom => mediaQueryPadding.bottom;

  double get bottomSpacing => paddingBottom > 0 ? paddingBottom : 10;

  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;

  Palette get palette => Theme.of(this).extension<Palette>()!;

  T themeExtension<T>() => Theme.of(this).extension<T>()!;

  ThemeData copyWithThemeExtension(ThemeExtension themeExt) {
    return Theme.of(this).copyWith(extensions: [...Theme.of(this).extensions.values, themeExt]);
  }

  UserModel get user => read<AppCubit>().state.user!;
}

class UserModel {}
