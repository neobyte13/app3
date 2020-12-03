import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewShipments extends StatefulWidget {
  ViewShipments({Key key}) : super(key: key);
  @override
  _ViewShipmentsState createState() => _ViewShipmentsState();
}

class _ViewShipmentsState extends State<ViewShipments> {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    CollectionReference ditems =
        FirebaseFirestore.instance.collection('ditems');
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
                    StreamBuilder<QuerySnapshot>(
                      stream: ditems.snapshots(includeMetadataChanges: true),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return new ListView(
                          children: snapshot.data.docs
                              .map((DocumentSnapshot document) {
                            return new ListTile(
                              title: new Text(document.data()['pickup']),
                              subtitle: new Text(document.data()['delivery']),
                            );
                          }).toList(),
                        );
                      },
                    ),
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
