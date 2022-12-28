import 'dart:convert';

class UserModel {
  int? idUser;
  String username;
  String email;
  String address;
  String password;
  UserModel({
    this.idUser,
    required this.username,
    required this.email,
    required this.password,
    required this.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'],
        email: map['email'],
        password: map['password'],
        address: map['address']);
  }
  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'username': username,
      'email': email,
      'password': password,
      'address': address,
    };
  }
}

List<UserModel> userFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<UserModel>.from(
    data.map(
      (item) => UserModel.fromJson(item),
    ),
  );
}

String userToJson(UserModel data) {
  final jsondata = data.toJson();
  return json.encode(jsondata);
}
