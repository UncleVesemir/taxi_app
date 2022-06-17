part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginEmptyState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final Person person;
  const LoginLoadedState(this.person);
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(this.error);
}
