part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class SubmitEmailSuccess extends UsersState {
  final String email;
  SubmitEmailSuccess(this.email,);
  @override
  List<Object> get props => [email];
}

class SubmitEmailFailure extends UsersState {
  final bool email;
  SubmitEmailFailure(this.email);
  @override
  List<Object> get props => [email];
}