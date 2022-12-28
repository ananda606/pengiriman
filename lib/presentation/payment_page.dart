import 'package:flutter/material.dart';
import 'package:pengiriman/widgets/success_alert.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/payment';
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => SuccessAlert());
                  setState(() {
                    _isTrue = !_isTrue;
                  });
                },
                child: ListTile(
                    leading: const Icon(Icons.list),
                    trailing: Text("GFG",
                        style: _isTrue == false
                            ? TextStyle(color: Colors.red, fontSize: 15)
                            : TextStyle(color: Colors.green, fontSize: 15)),
                    title: Text("List item $index")),
              ),
            );
          }),
    );
  }
}
