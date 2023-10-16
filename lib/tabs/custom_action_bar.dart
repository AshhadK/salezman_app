import 'package:flutter/material.dart';
import '../constants.dart';

class Custom_Action_Bar extends StatelessWidget {
  String? title;
  bool hasBackArrow = false;
  final newPage;

  // ignore: prefer_typing_uninitialized_variables

  Custom_Action_Bar({
    required this.title,
    required this.hasBackArrow,
    required this.newPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      height: 46.0,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(20.0),
          //   bottomRight: Radius.circular(20.0),
          // ),
          color: lightseagreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: hasBackArrow ? white : lightseagreen,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 23.0,
                color: lightseagreen,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => newPage));
            },
          ),
          Text(
            title!,
            style: Constants.customBarHeading,
          ),
          Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: lightseagreen,
              borderRadius: BorderRadius.circular(8.0),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
