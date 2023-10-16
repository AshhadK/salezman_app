import 'dart:async';

import 'package:flutter/material.dart';
import '/constants.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../screens/home_page.dart';
import '../widget/dropdown_widget.dart';
import 'customer_info.dart';
import '../widget/input_field.dart';

class AVQuestions extends StatefulWidget {
  @override
  State<AVQuestions> createState() => _AVQuestionsState();
}

class _AVQuestionsState extends State<AVQuestions> {
  final items = ["Select", "Items 1", "Items 2"];
  final principal = ["Select", "Principal 1", "Principal 2"];
  final brand = ["Select", "Brand 1", "Brand 2"];
  var dropDownQuestions = ["Principal", "Brand", "Item"];
  var questions = [
    "Is the Product Available ? ",
    "Is the Available Product not expired for the next six months ? ",
    "Is the Product stored properly ? ",
    "Is the Product displayed properly ? "
  ];
  late FocusNode _labelTextNode0;
  late FocusNode _labelTextNode1;
  late FocusNode _labelTextNode2;
  late FocusNode _labelTextNode3;

  @override
  void initState() {
    _labelTextNode0 = FocusNode();
    _labelTextNode1 = FocusNode();
    _labelTextNode2 = FocusNode();
    _labelTextNode3 = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _labelTextNode0 = FocusNode();
    _labelTextNode1 = FocusNode();
    _labelTextNode2 = FocusNode();
    _labelTextNode3 = FocusNode();

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

  bool _loginFormLoading = false;
  void _submitForm() async {
    Timer(
      Duration(seconds: 2),
      () => setState(() {
        _loginFormLoading = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150 / 2),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        height: 160.0,
                        width: 300.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i = 0; i < dropDownQuestions.length; i++)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dropDownQuestions[i],
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  DropdownWidget(
                                    width: 180.0,
                                    marginTop: 0,
                                    dropdownvalue: (i == 0)
                                        ? principal[0]
                                        : (i == 1)
                                            ? brand[0]
                                            : items[0],
                                    items: (i == 0)
                                        ? principal
                                        : (i == 1)
                                            ? brand
                                            : items,
                                    horizontalPadding: 24.0,
                                    textSyle: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 380.0,
                      width: 300.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < questions.length; i++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 210.0,
                                  child: Text(
                                    questions[i],
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: InputText(
                                    labelText: "Answer",
                                    maxLines: false,
                                    height: 35.0,
                                    disable: false,
                                    focusNode: i == 0
                                        ? _labelTextNode0
                                        : i == 1
                                            ? _labelTextNode1
                                            : i == 2
                                                ? _labelTextNode2
                                                : _labelTextNode3,
                                    isPasswordField: false,
                                    onChanged: (String) {},
                                    onSubmitted: (String) {
                                      i == 0
                                          ? _labelTextNode1.requestFocus()
                                          : i == 1
                                              ? _labelTextNode2.requestFocus()
                                              : i == 2
                                                  ? _labelTextNode3
                                                      .requestFocus()
                                                  : {
                                                      _labelTextNode3.unfocus(),
                                                      _submitForm()
                                                    };
                                    },
                                    textInputAction: i == 3
                                        ? TextInputAction.next
                                        : TextInputAction.done,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    CustomBtn(
                      text: 'Submit',
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _loginFormLoading,
                      width: 150.0,
                      color: lightseagreen,
                      TextStyle: Constants.btnText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'A / V Questions',
            hasBackArrow: true,
            newPage: CustomerInfo(),
          ),
        ],
      )),
    );
  }
}
