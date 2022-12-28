import 'package:http/http.dart';
import 'package:pengiriman/domain/models/user_model.dart';
class UserApi {
  final String url = "http://10.0.2.2:3001/api";
  Client client = Client();
  Future<List<UserModel>?> getUser() async {
    final response = await client.get(Uri.parse("$url/readProduct"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<List<UserModel>?> getUserId(int id) async {
    final response = await client.get(Uri.parse("$url/readProductById/$id"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<List<UserModel>?> getLoginUser(String email, String password) async {
    final response = await client.get(Uri.parse("$url/login/$email/$password"));
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createUser(UserModel data) async {
    final response = await client.post(Uri.parse("$url/createUser"),
        body: userToJson(data), headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateUser(UserModel data) async {
    final response = await client.put(
      Uri.parse("$url/api/updateProductById/${data.idUser}"),
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUser(int id) async {
    final response = await client.delete(
      Uri.parse("$url/api/deleteProductById/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
