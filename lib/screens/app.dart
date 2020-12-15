import 'package:GberaaDelivery/screens/home_screen.dart';
import 'package:GberaaDelivery/screens/location.dart';
import 'package:GberaaDelivery/screens/login_screen.dart';
import 'package:GberaaDelivery/screens/new_shipments.dart';
import 'package:GberaaDelivery/screens/onboard_screen/onboard_screen.dart';
import 'package:GberaaDelivery/screens/shipment_create.dart';
import 'package:GberaaDelivery/screens/track_shipments.dart';
import 'package:GberaaDelivery/screens/view_shipments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gberaa Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/landing',
        routes: {
          '/': (context) => OnBoardingPage(),
          '/login': (context) => LoginScreen(),
          //'/signup': (context) => SignupScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/newshimpent': (context) => NewShipments(),
          '/viewshipments': (context) => ViewShipments(),
          '/shipmentcreate': (context) => ShipmentCreate(),
          '/trackshipments': (context) => TrackShipments(),
          '/location': (context) => LocationSelect(),
          '/landing': (context) => Landing(),
        });
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FlutterSession().get('user'),
        builder: (context, snapshot) {
          return snapshot.hasData ? HomeScreen() : OnBoardingPage();
        });
  }
}
