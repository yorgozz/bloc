import 'package:equatable/equatable.dart';

abstract class SignInBlocEvent extends Equatable {}

class UpdateEmailEvent extends SignInBlocEvent {
  final String newEmail;

  UpdateEmailEvent(this.newEmail);

  @override
  List<Object?> get props => [newEmail];
}

class UpdatePasswordEvent extends SignInBlocEvent {
  final String newPassword;

  UpdatePasswordEvent(this.newPassword);

  @override
  List<Object?> get props => [newPassword];
}

class SignInPressedEvent extends SignInBlocEvent {
  @override
  List<Object?> get props => [];
}
