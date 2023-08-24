import 'package:display_name/data/enum/authenticationEnum.dart';
import 'package:equatable/equatable.dart';
import 'package:display_name/data/models/userModel.dart';

class AuthenticationBlocState extends Equatable {
  final UserModel currUser;
  final AuthStatus authenticationstatus;
  const AuthenticationBlocState(
      {this.currUser = UserModel.empty,
      this.authenticationstatus = AuthStatus.none});

  @override
  List<Object> get props => [currUser, authenticationstatus];
  AuthenticationBlocState copywith(
      {UserModel? usr, AuthStatus? authenticationstatus}) {
    return AuthenticationBlocState(
        currUser: usr ?? this.currUser,
        authenticationstatus:
            authenticationstatus ?? this.authenticationstatus);
  }
}
