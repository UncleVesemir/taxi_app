import 'package:taxi_app/src/domain/entities/person.dart';
import 'package:taxi_app/src/presentation/blocs/login/login_bloc.dart';

import 'firebase_provider.dart';

class FirebaseRepository {
  final UserProvider _userProvider = UserProvider();

  /// LOGIN/SIGN IN
  Future<Person?> login(SignInEvent event) async =>
      await _userProvider.login(event);
  Future<Person?> register(RegisterEvent event) async =>
      await _userProvider.register(event);
}
