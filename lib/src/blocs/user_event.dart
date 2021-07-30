import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoginButtonSubmitted extends UserEvent {
  final String email;
  final String password;
  UserLoginButtonSubmitted(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class UserEmailSubmitted extends UserEvent {
  final String email;
  UserEmailSubmitted(this.email);
  @override
  List<Object> get props => [email];
}

class UserPasswordSubmitted extends UserEvent {
  final String password;
  UserPasswordSubmitted(this.password);
  @override
  List<Object> get props => [password];
}

class UserSignupButtonSubmitted extends UserEvent {
  final String email;
  final String password;
  UserSignupButtonSubmitted(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
