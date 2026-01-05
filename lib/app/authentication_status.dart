import 'package:travisgen_client/common/extension/context_extension.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthenticatedState extends AuthState {
  final UserModel user;

  const AuthenticatedState({required this.user});
}

class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}
