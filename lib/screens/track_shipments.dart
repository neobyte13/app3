import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

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
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: maxSize.height * 0.07,
                    ),
                    Text(
                      'Feature Coming Soon',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
