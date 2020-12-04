import 'package:GberaaDelivery/utils/constants.dart';
import 'package:GberaaDelivery/models/ditem_model.dart';
import 'package:GberaaDelivery/providers/ditem_provider.dart';
import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationSelect extends StatefulWidget {
  final Ditem ditem;
  LocationSelect({Key key, this.ditem}) : super(key: key);

  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  final TextEditingController pickupController = TextEditingController();

  final TextEditingController deliveryController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    pickupController.dispose();
    deliveryController.dispose();
    nameController.dispose();
    phoneController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final ditemProvider = Provider.of<DitemProvider>(context, listen: false);
    if (widget.ditem != null) {
      //Edit
      pickupController.text = '';
      deliveryController.text = '';
      nameController.text = '';
      phoneController.text = '';
      notesController.text = '';

      ditemProvider.loadAll(widget.ditem);
    } else {
      //Add
      ditemProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ditemProvider = Provider.of<DitemProvider>(context);
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(
              maxSize: maxSize,
              labeltext: 'Pick Up and Delivery',
              aheight: 0.09,
              icolor: Colors.black,
            ),
            Container(
              width: maxSize.width,
              height: maxSize.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: maxSize.width * 0.4,
                        height: maxSize.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(5.0, 5.0),
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 16.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: 2,
                          child: Image(
                            image: AssetImage('assets/images/3.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: maxSize.width * 0.4,
                        height: maxSize.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(5.0, 5.0),
                              blurRadius: 8.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 16.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: 1,
                          child: Image(
                            image: AssetImage('assets/images/1.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: maxSize.width * 0.05,
                    right: maxSize.width * 0.05,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: maxSize.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDate(
                                  ditemProvider.date, [MM, ' ', d, ', ', yyyy]),
                              style: kNormalText,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                _pickDate(context, ditemProvider).then((value) {
                                  if (value != null) {
                                    ditemProvider.changeDate = value;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Container(
                                width: maxSize.width * 0.35,
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                      labelText: 'Receiver Name'),
                                  onChanged: (String value) =>
                                      ditemProvider.changeName = value,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                child: Icon(
                                  Icons.swap_horiz,
                                  color: kMainColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: maxSize.width * 0.35,
                                child: TextFormField(
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                      labelText: 'Receiver\'s Phone'),
                                  onChanged: (String value) =>
                                      ditemProvider.changePhone = value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: maxSize.width * 0.4,
                              child: TextFormField(
                                controller: pickupController,
                                decoration: const InputDecoration(
                                    labelText: 'Pickup Address'),
                                onChanged: (String value) =>
                                    ditemProvider.changePickup = value,
                              ),
                            ),
                            Container(
                              width: maxSize.width * 0.4,
                              child: TextFormField(
                                controller: deliveryController,
                                decoration: const InputDecoration(
                                    labelText: 'Delivery Address'),
                                onChanged: (String value) =>
                                    ditemProvider.changeDelivery = value,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Container(
                          height: 1.0,
                          width: maxSize.width,
                          color: Colors.grey[800],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package Details',
                                  style: kLightGreyText.copyWith(
                                    color: kMainColor,
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  height: maxSize.height * 0.02,
                                ),
                                Text(
                                  'Basic Package',
                                  style:
                                      kNormalText.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: maxSize.width * 0.5,
                                  child: TextFormField(
                                    controller: notesController,
                                    decoration: const InputDecoration(
                                        labelText: 'Notes'),
                                    onChanged: (String value) =>
                                        ditemProvider.changeNotes = value,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\₦1000",
                                  style: kMainHeading.copyWith(
                                    color: kMainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                                Text(
                                  'Estimated Price',
                                  style: kLightGreyText.copyWith(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: maxSize.width * 0.4,
                              height: maxSize.height * 0.06,
                              decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kMainColor,
                                      offset: Offset(0.5, 0.5),
                                      blurRadius: 5.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(-1.0, -1.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    ditemProvider.saveDitem();
                                    Navigator.pushNamed(
                                        context, '/viewshipments');
                                  },
                                  child: Text(
                                    'Submit',
                                    style: kMainHeading.copyWith(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        backgroundColor: kMainColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            (widget.ditem != null)
                                ? Container(
                                    width: maxSize.width * 0.4,
                                    height: maxSize.height * 0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: kMainColor,
                                            offset: Offset(0.5, 0.5),
                                            blurRadius: 5.0,
                                          ),
                                          BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(-1.0, -1.0),
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ]),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          ditemProvider
                                              .removeDitem(widget.ditem.id);
                                          Navigator.pushNamed(
                                              context, '/viewshipments');
                                        },
                                        child: Text(
                                          'Delete',
                                          style: kMainHeading.copyWith(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              backgroundColor: kMainColor),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _pickDate(
      BuildContext context, DitemProvider ditemProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: ditemProvider.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2021));
    if (picked != null) return picked;
  }
}
