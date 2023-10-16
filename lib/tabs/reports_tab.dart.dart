import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/landing_page.dart';
import '../widget/text_field.dart';
import 'custom_action_bar.dart';

class ReportsTab extends StatelessWidget {
  var labelText = [
    "Summary",
    "Others",
    "Time Stamping Report",
    "Product Wise Summary",
    "List of Schemes",
    "List of AIF",
    "Collection Summary",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.0),
            height: 500.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < labelText.length; i++)
                  LabelText(
                    labelText: (labelText[i]),
                    style: TextStyle(fontSize: 20.0),
                    height: 91 / 2,
                    color: black,
                  ),
              ],
            ),
          ),
          Custom_Action_Bar(
            title: 'Reports',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      ),
    );
  }
}
