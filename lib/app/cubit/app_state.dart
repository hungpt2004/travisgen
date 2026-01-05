part of 'app_cubit.dart';

class AppState extends Equatable {
  final UserModel? user;
  final Position? currentPosition;

  const AppState({this.user, this.currentPosition});

  @override
  List<Object?> get props => [user, currentPosition];

  AppState copyWith({UserModel? user, Position? currentPosition}) {
    return AppState(
      user: user ?? this.user,
      currentPosition: currentPosition ?? this.currentPosition,
    );
  }
}
