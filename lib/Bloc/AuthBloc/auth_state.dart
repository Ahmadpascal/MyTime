part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class Loading extends AuthState{
  @override
  List<Object> get props => [];
}

final class Authenticated extends AuthState{
  final Users loggedInUser;
  const Authenticated(this.loggedInUser);
  @override
  List<Object> get props => [loggedInUser];
}

final class ErrorState extends AuthState{
  final String error;
  const ErrorState(this.error);
  @override
  List<Object> get props => [error];
}

final class LogoutState extends AuthState{
  @override
  List<Object> get props => [];
}

final class SuccessRegister extends AuthState{
  @override
  List<Object> get props => [];
}
