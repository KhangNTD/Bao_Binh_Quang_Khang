import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserEmailSubmitFailure extends UserState {
  @override
  List<Object> get props => [];
}

class UserEmailSubmitSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserPasswordSubmitFailure extends UserState {
  @override
  List<Object> get props => [];
}

class UserPasswordSubmitSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoginLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoginSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoginFailure extends UserState {
  final FirebaseAuthException exception;
  UserLoginFailure(this.exception);
  @override
  List<Object> get props => [exception];
}
