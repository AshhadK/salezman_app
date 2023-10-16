import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/home_page.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/checkbox.dart';
import '../../widget/custom_btn.dart';
import 'collections.dart';
import '../widget/input_field.dart';

class DSL extends StatefulWidget {
  @override
  State<DSL> createState() => _DSLState();
}

class _DSLState extends State<DSL> {
  bool enable = true;
  bool checkBoxVal = false;
  var labelText = [
    "Shop No",
    "Market",
    "Police Station",
    "Tehsil",
    "Union Council",
    "Phone No",
    "License"
  ];
  late FocusNode _labelTextNode0;
  late FocusNode _labelTextNode1;
  late FocusNode _labelTextNode2;
  late FocusNode _labelTextNode3;
  late FocusNode _labelTextNode4;
  late FocusNode _labelTextNode5;
  late FocusNode _labelTextNode6;

  @override
  void initState() {
    _labelTextNode0 = FocusNode();
    _labelTextNode1 = FocusNode();
    _labelTextNode2 = FocusNode();
    _labelTextNode3 = FocusNode();
    _labelTextNode4 = FocusNode();
    _labelTextNode5 = FocusNode();
    _labelTextNode6 = FocusNode();
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
    _labelTextNode6 = FocusNode();
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
              margin: EdgeInsets.symmetric(vertical: 130 / 2),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VENDERS’ SHOP NAME",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 44 / 2),
                        ),
                        Text(
                          "Salesman Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30 / 2),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34 / 2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                              color: grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(24.0)),
                        width: 330,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i = 0; i < (labelText.length) - 1; i++)
                              InputText(
                                  labelText: labelText[i],
                                  maxLines: false,
                                  height: 40.0,
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
                                  onChanged: (String) {},
                                  onSubmitted: (String) {
                                    i == 0
                                        ? _labelTextNode1.requestFocus()
                                        : i == 1
                                            ? _labelTextNode2.requestFocus()
                                            : i == 2
                                                ? _labelTextNode3.requestFocus()
                                                : i == 3
                                                    ? _labelTextNode4
                                                        .requestFocus()
                                                    : i == 4
                                                        ? _labelTextNode5
                                                            .requestFocus()
                                                        : i == 5
                                                            ? _labelTextNode6
                                                                .requestFocus()
                                                            : _labelTextNode6
                                                                .unfocus();
                                  },
                                  textInputAction: TextInputAction.next),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 10.0),
                                    width: 90.0,
                                    child: Text("DSL")),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70.0, top: 10.0),
                                  child: MyCheckBox(
                                    checkBoxVal: false,
                                    text: "Update",
                                  ),
                                ),
                              ],
                            ),
                            InputText(
                              labelText: labelText[labelText.length - 1],
                              maxLines: false,
                              height: 45.0,
                              disable: false,
                              focusNode: _labelTextNode6,
                              isPasswordField: false,
                              onChanged: (String) {},
                              onSubmitted: (String) {
                                _labelTextNode6.unfocus();
                              },
                              textInputAction: TextInputAction.done,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 170.0, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    padding: EdgeInsets.all(1.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: lightseagreen, width: 3.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Checkbox(
                                      value: checkBoxVal,
                                      onChanged: (value) {
                                        setState(() {
                                          checkBoxVal = value!;
                                          enable = !value;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text("Update")),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30.0),
                              child: CustomBtn(
                                text: "Save",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                isLoading: false,
                                width: 150.0,
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
            title: 'DSL',
            hasBackArrow: true,
            newPage: Collections(),
          ),
        ],
      )),
    );
  }
}
