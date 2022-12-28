import 'package:flutter/material.dart';
import 'package:pengiriman/domain/api/parcel_api.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/presentation/homepage.dart';
import 'package:pengiriman/widgets/success_alert.dart';

class DeliveryRequest extends StatefulWidget {
  static const routeName = '/delivery';
  const DeliveryRequest({super.key});

  @override
  State<DeliveryRequest> createState() => _DeliveryRequestState();
}

class _DeliveryRequestState extends State<DeliveryRequest> {
  final TextEditingController _parcelNameController = TextEditingController();
  final TextEditingController _parcelDestinationController =
      TextEditingController();
  final TextEditingController _parcelLatDesController = TextEditingController();
  final TextEditingController _parcelLngDesController = TextEditingController();
  final TextEditingController _parcelLocationController =
      TextEditingController();
  final TextEditingController _parcelLatLocController = TextEditingController();
  final TextEditingController _parcelLngLocController = TextEditingController();
  final ParcelApi _parcelApi = ParcelApi();

  @override
  void initState() {
    super.initState();
    _parcelApi;
    _parcelDestinationController;
    _parcelLatDesController;
    _parcelLatLocController;
    _parcelLngDesController;
    _parcelLngLocController;
    _parcelLocationController;
    _parcelNameController;
  }

  @override
  void dispose() {
    _parcelDestinationController.dispose();
    _parcelLatDesController.dispose();
    _parcelLatLocController.dispose();
    _parcelLngDesController.dispose();
    _parcelLngLocController.dispose();
    _parcelLocationController.dispose();
    _parcelNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengiriman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Center(
              child: Text(
                'Delivery Request',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Parcel Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelDestinationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Parcel Destination',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelLatDesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Latitude Destination',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelLngDesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Longitude Destination',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelLocationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Parcel Location',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelLatLocController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Latitude Location',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 80,
              height: 50,
              child: TextField(
                enabled: true,
                cursorColor: Colors.blue,
                controller: _parcelLngLocController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Longitude Location',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
              child: ElevatedButton(
                child: const Text('Create Delivery Request'),
                onPressed: () {
                  String parcelName = _parcelNameController.text.toString();
                  String parcelDestination =
                      _parcelDestinationController.text.toString();
                  double latDes = double.parse(_parcelLatDesController.text);
                  double lngDes = double.parse(_parcelLngDesController.text);
                  String parcelLocation =
                      _parcelLocationController.text.toString();
                  double latLoc = double.parse(_parcelLatLocController.text);
                  double lngLoc = double.parse(_parcelLngLocController.text);

                  if (_parcelNameController.text.isNotEmpty &&
                      _parcelDestinationController.text.isNotEmpty &&
                      _parcelLatDesController.text.isNotEmpty &&
                      _parcelLngDesController.text.isNotEmpty &&
                      _parcelLocationController.text.isNotEmpty &&
                      _parcelLatLocController.text.isNotEmpty &&
                      _parcelLngLocController.text.isNotEmpty) {
                    ParcelModel parcelModel = ParcelModel(
                        parcelName: parcelName,
                        parcelDestination: parcelDestination,
                        latDes: latDes,
                        lngDes: lngDes,
                        parcelLocation: parcelLocation,
                        latLoc: latLoc,
                        lngLoc: lngLoc);
                    _parcelApi.createParcel(parcelModel);
                     showDialog(
                      context: context, builder: (context) => SuccessAlert());
          
          
                    print(parcelModel);
                    
                  } else {
                    const AlertDialog(
                      title: Text('data tidak lengkap'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
