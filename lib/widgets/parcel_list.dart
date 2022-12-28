import 'package:flutter/material.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/presentation/delivery_detail.dart';

class ParcelList extends StatelessWidget {
    static const routeName = '/parcel_list';
  final List<ParcelModel> parcel;
  ParcelList(this.parcel);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final parcelList = parcel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: InkWell(onTap: () {
                Navigator.pushNamed(
                  context,
                  DeliveryDetail.routeName,
                  arguments: parcelList.idParcel,
                );
              }, child:
              Card(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      // showDialog(
                      //     context: context, builder: (context) => SuccessAlert());
                      // setState(() {
                      //   _isTrue = !_isTrue;
                      // });
                    },
                    child: ListTile(
                        leading: const Icon(Icons.list),
                        trailing: Text("GFG",
                            style:
                                TextStyle(color: Colors.green, fontSize: 15)),
                        title: Text("${parcelList.parcelName}")),
                  ),
                )
              )
            ),
          );
        },
        itemCount: parcel.length,
      ),
    );
  }
}
