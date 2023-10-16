import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_salezman/widget/login_widget.dart';
import '../constants.dart';
import '../widget/custom_btn.dart';
import '../widget/date.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text("Error"),
              content: Container(
                child: Text(error),
              ),
              actions: [
                TextButton(
                  child: Text('close dialog'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]);
        });
  }

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
                  SizedBox(height: 130.0),
                  Text(
                    "Location",
                    style: Constants.normalHeading,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "309-Karachi East Depot",
                    style: Constants.normalMainHeading,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Working Date",
                    style: Constants.normalHeading,
                  ),
                  MyDate(),
                  LoginWidget(),
                ],
              ),
            ),
            Align(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 60.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: darkseagreen),
                  width: 140.0,
                  height: 140.0,
                  child: Image.asset('assets/images/logo.png', scale: 3.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
