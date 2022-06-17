import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/src/data/firebase/firebase_repository.dart';
import 'package:taxi_app/src/domain/entities/person.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginEmptyState()) {
    on<SignInEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final Person? person = await FirebaseRepository().login(event);
        if (person != null) {
          emit(LoginLoadedState(person));
        } else {
          emit(const LoginErrorState('error'));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final Person? person = await FirebaseRepository().register(event);
        if (person != null) {
          emit(LoginLoadedState(person));
        } else {
          emit(const LoginErrorState('error'));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
