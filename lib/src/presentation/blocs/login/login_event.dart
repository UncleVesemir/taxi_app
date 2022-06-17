part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
}

class RegisterEvent extends LoginEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterEvent({
    required this.email,
    required this.phone,
    required this.password,
    required this.name,
  });
}
