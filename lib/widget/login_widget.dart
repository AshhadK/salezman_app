import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/home_page.dart';
import '../screens/landing_page.dart';
import 'custom_btn.dart';
import 'input_box.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _loginFormLoading = false;

  String _loginDate = "", _loginPjp = "", _loginDsr = "", _loginPassword = "";

  late FocusNode _passwordFocusNode, _pjpFocusNode, _dsrFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _pjpFocusNode = FocusNode();
    _dsrFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode = FocusNode();
    _pjpFocusNode = FocusNode();
    _dsrFocusNode = FocusNode();
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget confirmButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert", style: TextStyle(color: Colors.red)),
      content: Text("Some Input Fields are Missing"),
      actions: [
        confirmButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _submitForm() async {
    setState(() {
      if (_loginPjp.isNotEmpty &&
          _loginDsr.isNotEmpty &&
          _loginPassword.isNotEmpty) {
        _loginFormLoading = true;
        Timer(
          Duration(seconds: 2),
          () => setState(() {
            _loginFormLoading = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          }),
        );
      } else
        showAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: white,
            border: Border.all(
              color: grey,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(24.0)),
        width: 300,
        height: 300.0,
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      "PJP",
                      style: Constants.italicHeading,
                    ),
                  ),
                  InputBox(
                    width: 120,
                    margin: 0,
                    hintText: 'Enter ...',
                    onChanged: (value) {
                      _loginPjp = value;
                    },
                    focusNode: _pjpFocusNode,
                    onSubmitted: (value) {
                      _dsrFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    isPasswordField: false,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text("DSR", style: Constants.italicHeading)),
                  InputBox(
                    width: 120,
                    margin: 0,
                    hintText: 'Enter ...',
                    focusNode: _dsrFocusNode,
                    onChanged: (value) {
                      _loginDsr = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    isPasswordField: false,
                  ),
                ],
              )
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text("Password", style: Constants.italicHeading)),
                InputBox(
                  width: 250,
                  margin: 0,
                  hintText: 'Enter Password ...',
                  onChanged: (value) {
                    _loginPassword = value;
                  },
                  focusNode: _passwordFocusNode,
                  onSubmitted: (value) {
                    _passwordFocusNode.unfocus();
                    _submitForm();
                  },
                  textInputAction: TextInputAction.done,
                  isPasswordField: true,
                ),
              ],
            ),
            CustomBtn(
              text: "Login",
              onPressed: () => {
                setState(() {
                  _submitForm();
                })
              },
              color: lightseagreen,
              TextStyle: Constants.btnText,
              isLoading: _loginFormLoading,
              width: 280 / 2,
            )
          ],
        ));
  }
}
