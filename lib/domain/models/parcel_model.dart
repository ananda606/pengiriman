import 'dart:convert';

class ParcelModel {
  int? idParcel;
  String parcelName;
  String parcelDestination;
  double latDes;
  double lngDes;
  String parcelLocation;
  double latLoc;
  double lngLoc;
  ParcelModel({
    this.idParcel,
    required this.parcelName,
    required this.parcelDestination,
    required this.latDes,
    required this.lngDes,
    required this.parcelLocation,
    required this.latLoc,
    required this.lngLoc,
  });
  factory ParcelModel.fromJson(Map<String, dynamic> map) {
    return ParcelModel(
        idParcel: map['idParcel'],
        parcelName: map['parcelName'],
        parcelDestination: map['parcelDestination'],
        latDes: map['latDes'],
        lngDes: map['lngDes'],
        parcelLocation: map['parcelLocation'],
        latLoc: map['latLoc'],
        lngLoc: map['lngLoc']);
  }
  Map<String, dynamic> toJson() {
    return {
      'idParcel': idParcel,
      'parcelName': parcelName,
      'parcelDestination': parcelDestination,
      'latDes': latDes,
      'lngDes': lngDes,
      'parcelLocation': parcelLocation,
      'latLoc': latLoc,
      'lngLoc': lngLoc,
    };
  }
}

List<ParcelModel> parcelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ParcelModel>.from(
    data.map(
      (item) => ParcelModel.fromJson(item),
    ),
  );
}

String parcelToJson(ParcelModel data) {
  final jsondata = data.toJson();
  return json.encode(jsondata);
}
