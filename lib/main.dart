import 'package:flutter/material.dart';
import 'package:pengiriman/common/constants.dart';
import 'package:pengiriman/common/utils.dart';
import 'package:pengiriman/domain/models/parcel_model.dart';
import 'package:pengiriman/domain/models/user_model.dart';
import 'package:pengiriman/presentation/delivery_request.dart';
import 'package:pengiriman/presentation/gmaps.dart';
import 'package:pengiriman/presentation/login_page.dart';
import 'package:pengiriman/presentation/maps.dart';
import 'package:pengiriman/presentation/payment_page.dart';
import 'package:pengiriman/presentation/register_page.dart';
import 'package:pengiriman/presentation/homepage.dart';
import 'injection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengiriman',
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
              case DeliveryRequest.routeName:
            return MaterialPageRoute(builder: (_) => DeliveryRequest());
              case PaymentPage.routeName:
            return MaterialPageRoute(builder: (_) => PaymentPage());
          case Homepage.routeName:
            return MaterialPageRoute(builder: (_) => Homepage());
          case GoogleMaps.routeName:
            return MaterialPageRoute(builder: (_) => GoogleMaps());
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (_) => LoginPage());
          case RegisterPage.routeName:
            return MaterialPageRoute(builder: (_) => RegisterPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
