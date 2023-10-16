import 'package:flutter/material.dart';
import '/constants.dart';

import '../tabs/custom_action_bar.dart';
import 'landing_page.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var headingList1 = ["Design and Developed", "By", "M&P IT Department"];
  var headingList2 = ["v 20.02.12.2", "supportdesk@mulphico.pk"];
  var headingList3 = [
    "Ⓒ2022  All Rights Reserved",
    "Muller & Phipps Pakistan (Pvt.) Limited"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 114 / 2, bottom: 8.0),
                  child: Image.asset(
                    'assets/images/unnamed.png',
                    width: 206,
                    height: 206,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: lightseagreen,
                    borderRadius: BorderRadius.circular(35 / 2)),
                width: double.infinity,
                height: 232 / 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < headingList1.length; i++)
                        Text(
                          headingList1[i],
                          style: TextStyle(
                              color: white,
                              fontSize: 40 / 2,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      for (var i = 0; i < headingList2.length; i++)
                        Text(
                          headingList2[i],
                          style: TextStyle(
                              fontSize: 35 / 2, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/mnp-logo.jpg',
                  width: 264 / 2,
                  height: 142 / 2,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      for (var i = 0; i < headingList3.length; i++)
                        Text(
                          headingList3[i],
                          style: TextStyle(
                              fontSize: 35 / 2, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Custom_Action_Bar(
            title: 'About Us',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      )),
    );
  }
}
