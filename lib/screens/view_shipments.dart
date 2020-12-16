import 'package:GberaaDelivery/models/ditem_model.dart';
import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

dynamic curUser;

class ViewShipments extends StatefulWidget {
  ViewShipments({Key key}) : super(key: key);
  @override
  _ViewShipmentsState createState() => _ViewShipmentsState();
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('ditems')
        .where('owner', isEqualTo: curUser.toString())
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildList(context, snapshot.data.docs);
    },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Ditem.fromSnapshot(data);

  return Padding(
    key: ValueKey(record.name),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text('Package To: ' + record.name),
        subtitle: Text('Status: Pending'),
        trailing: Text('Ref No: ' + record.date),
        onTap: () => print(record),
      ),
    ),
  );
}

getCurUser() async {
  curUser = await FlutterSession().get('user');
  print(curUser.toString());
}

class _ViewShipmentsState extends State<ViewShipments> {
  @override
  void initState() {
    getCurUser();
    super.initState();
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
                    _buildBody(context),
                    SizedBox(
                      height: maxSize.height * 0.07,
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
