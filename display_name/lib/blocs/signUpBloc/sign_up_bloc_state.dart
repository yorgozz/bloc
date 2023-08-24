import '../../data/enum/signupEnum.dart';

class SignupBlocState {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final SignupStatus signupStatus;
  final String error;

  SignupBlocState(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.signupStatus,
      required this.error});

  SignupBlocState copyWith(
      {String? email,
      String? firstName,
      String? lastName,
      String? password,
      SignupStatus? signupStatus,
      String? error}) {
    return SignupBlocState(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        signupStatus: signupStatus ?? this.signupStatus,
        error: error ?? this.error);
  }
}
