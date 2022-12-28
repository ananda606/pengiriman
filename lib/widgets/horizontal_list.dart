import 'package:pengiriman/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:pengiriman/domain/models/user_model.dart';
import 'package:pengiriman/presentation/delivery_request.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: (() {}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.payment),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Pay\nYour delivery'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
