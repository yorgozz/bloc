class SignInBlocState {
  final String email;
  final String password;

  SignInBlocState(this.email, this.password);

  SignInBlocState copyWith({String? email, String? password}) {
    return SignInBlocState(
      email ?? this.email,
      password ?? this.password,
    );
  }
}
