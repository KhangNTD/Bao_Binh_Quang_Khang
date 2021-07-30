import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class UserEmailSubmitFailure extends SignupState {
  @override
  List<Object> get props => [];
}

class UserEmailSubmitSuccess extends SignupState {
  @override
  List<Object> get props => [];
}

class UserPasswordSubmitFailure extends SignupState {
  @override
  List<Object> get props => [];
}

class UserPasswordSubmitSuccess extends SignupState {
  @override
  List<Object> get props => [];
}

class UserSignupLoading extends SignupState {
  @override
  List<Object> get props => [];
}


class UserSignupSuccess extends SignupState {
  @override
  List<Object> get props => [];
}

class UserSignupFailure extends SignupState {
  final String exception;
  UserSignupFailure(this.exception);
  @override
  List<Object> get props => [exception];
}