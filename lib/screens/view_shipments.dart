import 'dart:async';

import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewShipments extends StatefulWidget {
  ViewShipments({Key key}) : super(key: key);
  @override
  _ViewShipmentsState createState() => _ViewShipmentsState();
}

class _ViewShipmentsState extends State<ViewShipments> {
  List<Ditem> _ditems = [];
  StreamSubscription _ditemSubs;

  @override
  void initState() {
    _getMessages();
    super.initState();
  }

  @override
  void dispose() {
    _ditemSubs.cancel();
    super.dispose();
  }

  void _getMessages() {
    final FirebaseFirestore _db = FirebaseFirestore.instance;

    _ditemSubs = _db.collection('ditems').snapshots().listen(
      (_ditem) {
        _ditems = _ditem.docs.map((doc) => Ditem.fromMap(doc.data()));
        setState(() {});
      },
      onError: (error) {
        print(error);
      },
      onDone: () {
        print('Stream Closed');
      },
    );
  }

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
              labeltext: 'All Deliveries',
              aheight: 0.09,
              icolor: Colors.white,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: maxSize.width,
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
                  ],
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _ditems.length,
              itemBuilder: (BuildContext context, int idx) => Column(
                children: [
                  Text('Pickup Address: ${_ditems[idx].pickup}'),
                  Text('Delivery Address: ${_ditems[idx].delivery}'),
                  Text('Notes: ${_ditems[idx].notes}'),
                  Text('Date: ${_ditems[idx].date}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ditem {
  final String pickup;
  final String delivery;
  final String date;
  final String notes;

  Ditem({this.date, this.delivery, this.notes, this.pickup});

  factory Ditem.fromMap(Map data) => Ditem(
        pickup: data['pickup'] ?? '',
        delivery: data['delivery'] ?? '',
        date: data['date'] ?? '',
        notes: data['notes'] ?? '',
      );
}
