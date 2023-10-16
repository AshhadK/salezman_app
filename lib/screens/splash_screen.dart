import 'dart:async';
import 'package:flutter/material.dart';
import '/constants.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightseagreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', scale: 1.5),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 24.0,
              ),
              width: 300,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(12.0)),
              child: const Text(
                'SALEZMAN',
                style: Constants.splashHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: const SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 7.0,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
