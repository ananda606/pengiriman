import 'package:flutter/material.dart';
import 'package:pengiriman/common/constants.dart';
import 'package:pengiriman/domain/api/parcel_api.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';

class DeliveryDetail extends StatefulWidget {
  static const routeName = '/delivery_detail';
  final int id;
  DeliveryDetail({required this.id});

  @override
  State<DeliveryDetail> createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  ParcelApi parcelApi = new ParcelApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parcelApi = ParcelApi();
    parcelApi.getParcelId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: parcelApi.getParcelId(widget.id),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('something wrong!'));
              } else if (snapshot.hasData) {
                late List<ParcelModel>? parcels = snapshot.data;
                return SafeArea(
                    child: SingleChildScrollView(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text(
                        '${parcels![0].idParcel}',
                        style: kHeading5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text(
                        '${parcels[0].parcelName}',
                        style: kHeading5,
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text(
                        'Destination ${parcels[0].parcelDestination}',
                        style: kHeading5,
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text(
                        'Parcel location ${parcels[0].parcelLocation}',
                        style: kHeading5,
                      ),
                    ),
                      
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text(
                        'Please enter your tracking number',
                        style: kSubtitle,
                      ),
                    ),
                  ]),
                ));
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }
}
