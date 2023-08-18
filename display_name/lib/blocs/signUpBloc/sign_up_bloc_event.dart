import 'package:equatable/equatable.dart';

abstract class SignupBlocEvent extends Equatable {}

class UpdateEmailEvent extends SignupBlocEvent {
  final String newEmail;

  UpdateEmailEvent(this.newEmail);

  @override
  List<Object?> get props => [newEmail];
}

class UpdateFirstNameEvent extends SignupBlocEvent {
  final String newFirstName;

  UpdateFirstNameEvent(this.newFirstName);

  @override
  List<Object?> get props => [newFirstName];
}

class UpdateLastNameEvent extends SignupBlocEvent {
  final String newLastName;

  UpdateLastNameEvent(this.newLastName);

  @override
  List<Object?> get props => [newLastName];
}

class UpdatePasswordEvent extends SignupBlocEvent {
  final String newPassword;

  UpdatePasswordEvent(this.newPassword);

  @override
  List<Object?> get props => [newPassword];
}

class PressSignUpEvent extends SignupBlocEvent {
  @override
  List<Object?> get props => [];
}
