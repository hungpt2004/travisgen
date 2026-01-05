import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:geolocator/geolocator.dart';
import 'package:travisgen_client/common/extension/context_extension.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
  }

  Future<void> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      emit(state.copyWith(currentPosition: position));
    } catch (_) {}
  }
}
