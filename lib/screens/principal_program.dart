import 'package:flutter/material.dart';
import '/constants.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../widget/dropdown_widget.dart';
import 'customer_info.dart';
import 'home_page.dart';

class PrincipalProgram extends StatefulWidget {
  @override
  State<PrincipalProgram> createState() => _PrincipalProgramState();
}

class _PrincipalProgramState extends State<PrincipalProgram> {
  final items = ["Select", "Items 1", "Items 2"];
  final principal = ["Select", "Principal 1", "Principal 2"];
  final brand = ["Select", "Brand 1", "Brand 2"];
  var dropDownQuestions = ["Principal", "Brand", "Item"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 80 / 2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300.0,
                    width: 300.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "VENDER'S SHOP NAME",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        ),
                        for (var i = 0; i < dropDownQuestions.length; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  CustomBtn(
                    text: 'Submit',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    isLoading: false,
                    width: 150.0,
                    color: lightseagreen,
                    TextStyle: Constants.btnText,
                  ),
                ],
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'Principal Program',
            hasBackArrow: true,
            newPage: CustomerInfo(),
          ),
        ],
      )),
    );
  }
}
