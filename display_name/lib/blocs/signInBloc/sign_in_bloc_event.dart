import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final String email;
  final String password;
  final BuildContext context;

  SignInPressedEvent(this.context, this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
