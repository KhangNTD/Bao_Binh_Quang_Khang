import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app/src/utils/validator.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    switch (event.runtimeType) {
      case SubmitEmail:
        event as SubmitEmail;
        if (!Validators.isValidEmail(event.email)) {
          yield SubmitEmailFailure(false);
        } else {
         yield SubmitEmailSuccess(event.email);
        }
        break;
      default:
    }
    // TODO: implement mapEventToState
  }
}
