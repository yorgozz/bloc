import '../../data/enum/signinEnum.dart';

class SignInBlocState {
  final String email;
  final String password;
  final SigninStatus signinStatus;
  final String error;

  SignInBlocState(
      {required this.email,
      required this.password,
      required this.signinStatus,
      required this.error});

  SignInBlocState copyWith(
      {String? email,
      String? password,
      SigninStatus? signinStatus,
      String? error}) {
    return SignInBlocState(
        email: email ?? this.email,
        password: password ?? this.password,
        signinStatus: signinStatus ?? this.signinStatus,
        error: error ?? this.error);
  }
}
