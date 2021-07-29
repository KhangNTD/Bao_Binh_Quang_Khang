

import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class UserEmailSubmitted extends SignupEvent {
  final String email;
  UserEmailSubmitted(this.email);
  @override
  List<Object> get props => [email];

}

class UserPasswordSubmitted extends SignupEvent{
  final String password;
  UserPasswordSubmitted(this.password);
  @override
  List<Object> get props => [password];
}
class UserSignupButtonSubmitted extends SignupEvent {
  final String email;
  final String password;
  UserSignupButtonSubmitted(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
