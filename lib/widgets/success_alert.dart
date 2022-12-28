import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pembelian berhasil'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('{product[0].productName}'),
          Text('Description:\n{product[0].productDescription}'),
          Text('Location:\n{product[0].productLocation}'),
          Text('Price:\nRp. {product[0].productPrice}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text('ok'),
          ),
        ),
      ],
    );
  }
}
