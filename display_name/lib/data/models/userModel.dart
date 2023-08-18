class UserModel {
  String email;
  String firstName;
  String lastName;
  String userId;

  UserModel({
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
}
