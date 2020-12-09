import 'package:GberaaDelivery/screens/app.dart';
import 'package:GberaaDelivery/utils/spdb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedDb.getInstance();
  await Firebase.initializeApp();
  runApp(App());
}
