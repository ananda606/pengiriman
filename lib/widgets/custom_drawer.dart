import 'package:pengiriman/domain/api/user_api.dart';
import 'package:pengiriman/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    UserApi userApi = UserApi();
    return Drawer(
      child: Column(children: [
        SizedBox(
          height: 200,
        ),
        ListTile(
          leading: Icon(Icons.account_circle_rounded),
        )
      ]),
    );
  }
}
