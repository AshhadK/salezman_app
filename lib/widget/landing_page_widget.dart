import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/about_us.dart';
import '/constants.dart';
import '../screens/home_page.dart';
import '../tabs/aif.dart';
import '../tabs/reports_tab.dart.dart';
import '../tabs/schemes_tab.dart';
import 'options.dart';

class LPageWidget extends StatefulWidget {
  @override
  State<LPageWidget> createState() => _LPageWidgetState();
}

class _LPageWidgetState extends State<LPageWidget> {
  late final newPage;
  final List iconList = [
    Icons.home,
    Icons.schedule,
    Icons.report,
  ];
  final List iconList2 = [
    Icons.online_prediction_sharp,
    Icons.account_box,
    Icons.settings,
  ];

  final List pagesText = [
    'HOME',
    'AIF',
    'REPORTS',
  ];
  final List pagesText2 = ['SCHEMES', 'ABOUT', 'OPTIONS'];

  // final List pagesName = [
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: double.infinity,
      height: 550 / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < iconList.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var j = 0; j < 2; j++)
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (i == 1 && j == 1)
                                ? AboutUs()
                                : (i == 2 && j == 1)
                                    ? OptionsPage()
                                    : HomePage()),
                      )
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color.fromARGB(255, 231, 231, 231)),
                      width: 285.0 / 2,
                      height: 110.0 / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            (j == 0)
                                ? iconList[i]
                                : (j == 1)
                                    ? iconList2[i]
                                    : null,
                            size: 27.0,
                            color: lightseagreen,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                (j == 0)
                                    ? pagesText[i]
                                    : (j == 1)
                                        ? pagesText2[i]
                                        : "",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
