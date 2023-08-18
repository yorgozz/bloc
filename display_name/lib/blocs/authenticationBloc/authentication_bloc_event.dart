part of 'authentication_bloc_bloc.dart';

@immutable
abstract class AuthenticationBlocEvent extends Equatable {}

class GetCurrentUserEvent extends AuthenticationBlocEvent {
  @override
  List<Object?> get props => [];
}

class SignOutUserEvent extends AuthenticationBlocEvent {
  @override
  List<Object> get props => [];
}
