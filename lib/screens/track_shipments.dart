import 'package:GberaaDelivery/widgets/card_with_check.dart';
import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:GberaaDelivery/widgets/custom_button.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class TrackShipments extends StatefulWidget {
  @override
  _TrackShipmentsState createState() => _TrackShipmentsState();
}

class _TrackShipmentsState extends State<TrackShipments> {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF161615),
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(
              maxSize: maxSize,
              labeltext: 'Track Deliveries',
              aheight: 0.09,
              icolor: Colors.white,
            ),
            Text(
              'Feature Coming Soon',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
