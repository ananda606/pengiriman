import 'package:flutter/material.dart';
import 'package:pengiriman/common/constants.dart';
import 'package:pengiriman/widgets/horizontal_list.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _trackNumber = TextEditingController();
  @override
  void initState() {
    super.initState();
    _trackNumber = TextEditingController();
  }

  @override
  void dispose() {
    _trackNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('pengiriman'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Text(
                'Track your parcels',
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 50,
                child: TextField(
                
                  enabled: true,
                  cursorColor: Colors.blue,
                  controller: _trackNumber,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'enter track number',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
              child: Text(
                'Our Service',
                style: kHeading5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HorizontalList(),
          ],
        ),
      )),
    );
  }
}
