import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:taxi_app/src/domain/entities/person.dart';
import 'package:taxi_app/src/presentation/blocs/login/login_bloc.dart';

class UserProvider {
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Person?> login(SignInEvent event) async {
    final User? firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email, password: event.password))
        .user;

    if (firebaseUser != null) {
      userRef
          .child(firebaseUser.uid)
          .once()
          .then((value) => (DataSnapshot snap) {
                if (snap.value != null) {
                  //TODO
                  print(snap);
                } else {
                  _firebaseAuth.signOut();
                }
              });
    }
  }

  Future<Person?> register(RegisterEvent event) async {
    final User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email, password: event.password))
        .user;

    Person person =
        Person(name: event.name, email: event.email, phone: event.phone);

    if (user != null) {
      userRef.child(user.uid).set(person.toJson());
      return person;
    } else {
      return null;
    }
  }
}
