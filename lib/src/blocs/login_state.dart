import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSubmitSuccess extends LoginState {
  final String email;
  final String password;
  LoginSubmitSuccess(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class LoginSubmitFailure extends LoginState {
  final bool email;
  final bool password;
  LoginSubmitFailure(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
