class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String userId;

  const UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
    );
  }
  // factory UserModel.emptyUser() {
  //   return UserModel(
  //     email: '',
  //     firstName: '',
  //     lastName: '',
  //     userId: '',
  //   );
  // }

  static const empty = UserModel(
    email: '',
    firstName: '',
    lastName: '',
    userId: '',
  );

  @override
  String toString() {
    return 'UserModel{email=$email, firstName=$firstName, lastName=$lastName, userId=$userId}';
  }
}
