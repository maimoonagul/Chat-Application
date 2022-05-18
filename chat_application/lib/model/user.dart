class UserModel {
  String? username;
  String? email;
  String? password;

  UserModel({this.username, this.email, this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      password: map['password'],

    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}