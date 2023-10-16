import 'dart:async';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../widget/custom_btn.dart';
import '../widget/image_swipe.dart';
import '../widget/landing_page_widget.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        color: lightseagreen),
                    width: double.infinity,
                    height: 90.0,
                  ),
                ],
              ),
            ),
            Align(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70.0),
                    padding: EdgeInsets.only(
                      top: 50.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromARGB(255, 229, 238, 237)),
                    width: 610.0 / 2,
                    height: 381.0 / 2,
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Salezman App",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(186, 87, 85, 85)),
                        ),
                        Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type",
                          style: TextStyle(fontSize: 12.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ImageSwipe(),
                  LPageWidget(),
                ],
              ),
            ),
            Align(
              child: Container(
                margin: EdgeInsets.only(top: 50.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: darkseagreen),
                width: 70.0,
                height: 70.0,
                child: Image.asset('assets/images/logo.png', scale: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
