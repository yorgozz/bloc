class SignupBlocState {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  SignupBlocState(this.email, this.firstName, this.lastName, this.password);

  SignupBlocState copyWith(
      {String? email, String? firstName, String? lastName, String? password}) {
    return SignupBlocState(
      email ?? this.email,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      password ?? this.password,
    );
  }
}
