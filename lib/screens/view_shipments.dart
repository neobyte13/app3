import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewShipments extends StatelessWidget {
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
                        //where('owner',
                        //  isEqualTo: FirebaseAuth.instance.currentUser.email),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return new ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return new ListTile(
                                title: Text(document.data()['pickup']),
                                subtitle: Text(document.data()['delivery']),
                              );
                            }).toList(),
                          );
                        }),
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
