import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
