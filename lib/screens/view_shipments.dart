import 'package:GberaaDelivery/utils/constants.dart';
import 'package:GberaaDelivery/models/ditem_model.dart';
import 'package:GberaaDelivery/providers/ditem_provider.dart';
import 'package:GberaaDelivery/screens/location.dart';
import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewShipments extends StatefulWidget {
  ViewShipments({Key key}) : super(key: key);
  @override
  _ViewShipmentsState createState() => _ViewShipmentsState();
}

class _ViewShipmentsState extends State<ViewShipments> {
  @override
  Widget build(BuildContext context) {
    final ditemProvider = Provider.of<DitemProvider>(context);
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
                    StreamBuilder<List<Ditem>>(
                        stream: ditemProvider.ditems,
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: Icon(
                                  Icons.edit,
                                  color: kMainColor,
                                ),
                                title: Text(formatDate(
                                    DateTime.parse(snapshot.data[index].date),
                                    [MM, ' ', d, ', ', yyyy])),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LocationSelect(
                                          ditem: snapshot.data[index])));
                                },
                              );
                            },
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
