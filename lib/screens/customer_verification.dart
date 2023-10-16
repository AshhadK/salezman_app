import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/constants.dart';
import '../tabs/custom_action_bar.dart';
import '../widget/checkbox.dart';
import '../widget/custom_btn.dart';
import '../widget/dropdown_widget.dart';
import '../widget/input_field.dart';
import 'customer_info.dart';
import 'landing_page.dart';

class CustomerVerification extends StatefulWidget {
  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

class _CustomerVerificationState extends State<CustomerVerification> {
  var items = ["Select Status", "Filer", "Non Filer"];
  late String dropdownvalue;
  var a = [
    "POP Name : ",
    "POP Code :",
    "Prev POP Code :",
    "POP Address :",
  ];

  var labelText = [
    "Owner’s Name :",
    "CNIC No :",
    "CNIC Exp Date :",
    "NTN No :",
    "STRN No :",
    "Phone No :",
  ];
  var inputText = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  bool _loginFormLoading = false;

  late FocusNode _labelTextNode0;
  late FocusNode _labelTextNode1;
  late FocusNode _labelTextNode2;
  late FocusNode _labelTextNode3;
  late FocusNode _labelTextNode4;
  late FocusNode _labelTextNode5;

  @override
  void initState() {
    _labelTextNode0 = FocusNode();
    _labelTextNode1 = FocusNode();
    _labelTextNode2 = FocusNode();
    _labelTextNode3 = FocusNode();
    _labelTextNode4 = FocusNode();
    _labelTextNode5 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _labelTextNode0 = FocusNode();
    _labelTextNode1 = FocusNode();
    _labelTextNode2 = FocusNode();
    _labelTextNode3 = FocusNode();
    _labelTextNode4 = FocusNode();
    _labelTextNode5 = FocusNode();
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomerInfo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 140,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < a.length; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  a[i],
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              Text(
                                " Lorem Ipsum has been the industry",
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      // margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                            color: grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24.0)),
                      width: 330,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < labelText.length; i++)
                            InputText(
                              labelText: labelText[i],
                              maxLines: false,
                              height: 35.0,
                              disable: false,
                              focusNode: i == 0
                                  ? _labelTextNode0
                                  : i == 1
                                      ? _labelTextNode1
                                      : i == 2
                                          ? _labelTextNode2
                                          : i == 3
                                              ? _labelTextNode3
                                              : i == 4
                                                  ? _labelTextNode4
                                                  : _labelTextNode5,
                              isPasswordField: false,
                              onChanged: (String) {
                                // setState(() {
                                //   inputText[i] = inp;
                                //   print(inputText[i]);
                                // });
                              },
                              onSubmitted: (String inp) {
                                inputText[i] = inp;

                                // setState(() {
                                //   inputText[i] = inp;
                                //   print(inputText[i]);
                                // });
                                i == 0
                                    ? _labelTextNode1.requestFocus()
                                    : i == 1
                                        ? _labelTextNode2.requestFocus()
                                        : i == 2
                                            ? _labelTextNode3.requestFocus()
                                            : i == 3
                                                ? _labelTextNode4.requestFocus()
                                                : i == 4
                                                    ? _labelTextNode5
                                                        .requestFocus()
                                                    : _labelTextNode0
                                                        .requestFocus();
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyCheckBox(
                                checkBoxVal: false,
                                text: "Verified By Customer",
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("Text Filer Status")),
                                  DropdownWidget(
                                    textSyle: TextStyle(fontSize: 12.0),
                                    width: 130.0,
                                    marginTop: 0,
                                    dropdownvalue: items[0],
                                    items: items,
                                    horizontalPadding: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30.0),
                            child: CustomBtn(
                              text: "Save & Continue",
                              onPressed: () {
                                _submitForm();
                              },
                              isLoading: false,
                              width: 180.0,
                              color: lightseagreen,
                              TextStyle: Constants.btnText,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'Customer Verification',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      )),
    );
  }
}
