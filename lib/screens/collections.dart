import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/constants.dart';

import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../widget/dropdown_widget.dart';
import '../widget/input_field.dart';
import 'customer_info.dart';
import 'dsl.dart';

class Collections extends StatefulWidget {
  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  var items = ["Select ", "Coll 1", "Coll 2"];
  late String dropdownvalue;
  late FocusNode _labelTextNode;

  @override
  void initState() {
    _labelTextNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _labelTextNode = FocusNode();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 130 / 2),
              child: Column(
                children: [
                  Text(
                    "VENDERS’ SHOP NAME",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 44 / 2),
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                              color: grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(24.0)),
                        width: 330,
                        height: 1080 / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 287,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Coll Type",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      )),
                                  DropdownWidget(
                                    textSyle: TextStyle(fontSize: 14.0),
                                    width: 150.0,
                                    marginTop: 0,
                                    dropdownvalue: items[0],
                                    items: items,
                                    horizontalPadding: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10, left: 20.0),
                                    child: Text(
                                      "Amount",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    )),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: InputText(
                                    labelText: "",
                                    maxLines: true,
                                    height: 500 / 2,
                                    disable: false,
                                    focusNode: _labelTextNode,
                                    isPasswordField: false,
                                    onChanged: (String) {},
                                    textInputAction: TextInputAction.done,
                                    onSubmitted: (String) {},
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 0),
                              child: CustomBtn(
                                text: "Submit",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DSL()));
                                },
                                isLoading: false,
                                width: 180.0,
                                color: lightseagreen,
                                TextStyle: Constants.btnText,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'Collections',
            hasBackArrow: true,
            newPage: CustomerInfo(),
          ),
        ],
      )),
    );
  }
}
