import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CommonAppBar extends StatelessWidget {
  final labeltext;
  final aheight;
  final Color icolor;
  const CommonAppBar({
    Key key,
    @required this.maxSize,
    this.labeltext,
    this.aheight,
    this.icolor,
  }) : super(key: key);

  final Size maxSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: maxSize.width,
        height: maxSize.height * aheight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: icolor)),
            Container(
              alignment: Alignment.center,
              child: Text(
                labeltext,
                style: kMainHeading.copyWith(color: icolor, fontSize: 20),
              ),
            ),
            /*SizedBox(
              width: maxSize.width / 4,
            ),**/
            Icon(
              Icons.notifications_on,
              color: kMainColor,
            ),
          ],
        ),
      ),
    );
  }
}
