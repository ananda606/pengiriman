import 'package:http/http.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
class ParcelApi {
  final String url = "http://10.0.2.2:3001/api";
  Client client = Client();
  Future<List<ParcelModel>?> getParcel() async {
    final response = await client.get(Uri.parse("$url/readParcel"));
    if (response.statusCode == 200) {
      return parcelFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<List<ParcelModel>?> getParcelId(int id) async {
    final response = await client.get(Uri.parse("$url/readParcelById/$id"));
    if (response.statusCode == 200) {
      return parcelFromJson(response.body);
    } else {
      return null;
    }
  }
  Future<bool> createParcel(ParcelModel data) async {
    final response = await client.post(Uri.parse("$url/createparcel"),
        body: parcelToJson(data), headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateParcel(ParcelModel data) async {
    final response = await client.put(
      Uri.parse("$url/api/updateParcelById/${data.idParcel}"),
      headers: {"content-type": "application/json"},
      body: parcelToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteParcel(int id) async {
    final response = await client.delete(
      Uri.parse("$url/api/deleteParcelById/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
