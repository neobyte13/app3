import 'package:GberaaDelivery/screens/track_shipments.dart';
import 'package:GberaaDelivery/screens/view_shipments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:GberaaDelivery/screens/home_screen.dart';
import 'package:GberaaDelivery/screens/location.dart';
import 'package:GberaaDelivery/screens/login_screen.dart';
import 'package:GberaaDelivery/screens/new_shipments.dart';
import 'package:GberaaDelivery/screens/onboard_screen/onboard_screen.dart';
import 'package:GberaaDelivery/screens/shipment_create.dart';
import 'package:flutter/material.dart';
import 'package:GberaaDelivery/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gberaa Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => OnBoardingPage(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/newshimpent': (context) => NewShipments(),
          '/viewshipments': (context) => ViewShipments(),
          '/shipmentcreate': (context) => ShipmentCreate(),
          '/trackshipments': (context) => TrackShipments(),
          '/location': (context) => LocationSelect(),
        });
  }
}
