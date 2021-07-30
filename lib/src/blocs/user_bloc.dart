import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/user_service.dart';
import '../utils/validators.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  UserService _user = UserService();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    switch (event.runtimeType) {
      case UserEmailSubmitted:
        event as UserEmailSubmitted;
        if (!Validators.isValidEmail(event.email)) {
          yield UserEmailSubmitFailure();
        } else {
          yield UserEmailSubmitSuccess();
        }
        break;
      case UserPasswordSubmitted:
        event as UserPasswordSubmitted;
        if (!Validators.isValidPassword(event.password)) {
          yield UserPasswordSubmitFailure();
        } else {
          yield UserPasswordSubmitSuccess();
        }
        break;
      case UserLoginButtonSubmitted:
        event as UserLoginButtonSubmitted;
        yield UserLoading();
        try {
          await _user.auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          yield UserLoginSuccess();
        } on FirebaseAuthException catch (exception) {
          yield UserAuthFailure(exception);
        }
        break;
      case UserSignupButtonSubmitted:
        event as UserSignupButtonSubmitted;
        yield UserLoading();
        if (Validators.isValidEmail(event.email) &&
            Validators.isValidPassword(event.password)) {
          try {
            await _user.auth.createUserWithEmailAndPassword(
                email: event.email, password: event.password);
            yield UserSignUpSuccess();
          } on FirebaseAuthException catch (exception) {
            yield UserAuthFailure(exception);
          }
        }
    }
  }
}
