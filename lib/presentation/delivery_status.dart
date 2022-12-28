import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pengiriman/domain/api/parcel_api.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/presentation/gmaps.dart';
import 'package:pengiriman/widgets/map_arguments.dart';
import 'package:pengiriman/widgets/success_alert.dart';

class DeliveryStatus extends StatefulWidget {
  static const routeName = '/payment';
  DeliveryStatus({super.key});

  @override
  State<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  bool _isTrue = false;
  ParcelApi parcelApi = ParcelApi();
  @override
  void initState() {
    super.initState();
    parcelApi = ParcelApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: parcelApi.getParcel(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error.toString()}'),
            );
          } else if (snapshot.hasData) {
            List<ParcelModel>? parcels = snapshot.data;
            return ListView.builder(
                itemCount: parcels!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GoogleMaps(parcels[index].latDes, parcels[index].lngDes, parcels[index].latLoc, parcels[index].lngLoc)));

                        // showDialog(
                        //     context: context,
                        //     builder: (context) => SuccessAlert());
                        // setState(() {
                        //   _isTrue = !_isTrue;
                        // });
                      },
                      child: ListTile(
                          leading: const Icon(Icons.list),
                          trailing: Text("${parcels[index].parcelDestination}"),
                          //     style: _isTrue == false
                          //         ? TextStyle(color: Colors.red, fontSize: 15)
                          //         : TextStyle(
                          //             color: Colors.green, fontSize: 15)),
                          title: Text("${parcels[index].parcelName}")),
                    ),
                  );
                });
          } else {
            return Text('empty snapshot');
          }
        },
      ),
    );
  }
}
