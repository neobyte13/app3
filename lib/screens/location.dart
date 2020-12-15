import 'package:GberaaDelivery/utils/constants.dart';
import 'package:GberaaDelivery/widgets/common_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class LocationSelect extends StatefulWidget {
  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  final TextEditingController pickupController = TextEditingController();

  final TextEditingController deliveryController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController notesController = TextEditingController();

  CollectionReference ditemstore =
      FirebaseFirestore.instance.collection('ditems');

  dynamic curUser;

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
    pickupController.text = '';
    deliveryController.text = '';
    nameController.text = '';
    phoneController.text = '';
    notesController.text = '';
    getCurUser();
    super.initState();
  }

  getCurUser() async {
    curUser = await FlutterSession().get('user');
    print(curUser.toString());
  }

  Future<void> addDitem() {
    // Call the ditemstore's CollectionReference to add a new user
    return ditemstore
        .add({
          'pickup': pickupController.text,
          'delivery': deliveryController.text,
          'name': nameController.text,
          'phone': phoneController.text,
          'date': DateTime.now().toIso8601String(),
          'notes': notesController.text,
          'owner': curUser.toString(),
        })
        .then((value) => print("Ditem Added"))
        .catchError((error) => print("Failed to add ditem: $error"));
  }

  @override
  Widget build(BuildContext context) {
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
                              DateTime.now().toIso8601String(),
                              style: kNormalText,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                              ),
                              onPressed: () {},
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
                              ),
                            ),
                            Container(
                              width: maxSize.width * 0.4,
                              child: TextFormField(
                                controller: deliveryController,
                                decoration: const InputDecoration(
                                    labelText: 'Delivery Address'),
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
                                    addDitem();
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
}
