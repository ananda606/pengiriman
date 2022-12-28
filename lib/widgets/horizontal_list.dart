import 'package:pengiriman/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:pengiriman/domain/api/parcel_api.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/domain/models/user_model.dart';
import 'package:pengiriman/presentation/delivery_request.dart';
import 'package:pengiriman/presentation/gmaps.dart';
import 'package:pengiriman/presentation/payment_page.dart';
import 'package:pengiriman/widgets/parcel_list.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  ParcelApi parcelApi = ParcelApi();
  @override
  void initState() {

    super.initState();
    parcelApi = ParcelApi();
  }

  @override
  void dispose() {
    parcelApi;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: (() {
                Navigator.pushNamed(context, DeliveryRequest.routeName);
              }),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.delivery_dining),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add\nDelivery request'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: (() {
                      // Navigator.pushNamed(
                      //   context,
                      //   ParcelList.routeName,
                      // );
                       Navigator.pushNamed(context, PaymentPage.routeName);
                    }),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.drive_file_move_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Delivery\nstatus'),
                        ),
                      ],
                    ),
                  ))]));
                } 
              
  }

