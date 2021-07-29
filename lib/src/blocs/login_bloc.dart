import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/validators.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case LoginSubmitted:
        event as LoginSubmitted;
        if (!Validators.isValidEmail(event.email) &&
            Validators.isValidPassword(event.password)) {
          yield LoginSubmitFailure(false, true);
        } else if (!Validators.isValidPassword(event.password) &&
            Validators.isValidEmail(event.email)) {
          yield LoginSubmitFailure(true, false);
        } else if (!Validators.isValidEmail(event.email) &&
            !Validators.isValidPassword(event.password)) {
          yield LoginSubmitFailure(false, false);
        } else {
          yield LoginSubmitSuccess(event.email, event.password);
        }
        break;
    }
  }
}
