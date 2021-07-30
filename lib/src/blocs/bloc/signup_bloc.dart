import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/src/respositories/user_repositories.dart';
import 'package:mobile_app/util/validator.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());
  final UserResponsitory _userResponsitory = UserResponsitory();

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is UserEmailSubmitted) {
      try {
        if (!Validators.isValidEmail(event.email)) {
          yield UserEmailSubmitFailure();
        } else {
          yield UserEmailSubmitSuccess();
        }
      } catch (e) {
        print('error');
      }
    } else if (event is UserPasswordSubmitted) {
      if (!Validators.isValidPassword(event.password)) {
        yield UserPasswordSubmitFailure();
      } else {
        yield UserPasswordSubmitSuccess();
      }
    } else if (event is UserSignupButtonSubmitted) {
      yield UserSignupLoading();
      if (Validators.isValidEmail(event.email) &&
          Validators.isValidPassword(event.password)) {
        try {
          await _userResponsitory.signUp(event.email, event.password);
          yield UserSignupSuccess();
        } on FirebaseAuthException catch (exception) {
          yield UserSignupFailure(exception.toString());
        }
      }
    }
  }
}
