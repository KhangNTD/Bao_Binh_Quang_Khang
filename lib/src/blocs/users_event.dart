part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class SubmitEmail extends UsersEvent {
  final email;
  SubmitEmail(this.email);
  @override
    List<Object> get props => [email];

}
