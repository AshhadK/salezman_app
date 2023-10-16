import 'package:flutter/material.dart';
import '/constants.dart';

import '../../tabs/custom_action_bar.dart';
import '../screens/landing_page.dart';
import '../widget/all_btns.dart';
import '../widget/dropdown_widget.dart';
import '../widget/search_widget.dart';

class AIFTab extends StatefulWidget {
  @override
  _AIFTabState createState() => new _AIFTabState();
}

class _AIFTabState extends State<AIFTab> {
  TextEditingController editingController = TextEditingController();
  // List of items in our dropdown menu
  final items = List<String>.generate(5, (i) => "Item $i");
  final borderSide = BorderSide(
    color: black,
    width: 1.0,
    style: BorderStyle.solid,
  );
  @override
  Widget build(BuildContext context) {
    items[0] = "Select Item";
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DropdownWidget(
                width: 650.0 / 2,
                marginTop: 60.0,
                dropdownvalue: items[0],
                items: items,
                horizontalPadding: 24.0,
                textSyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              SearchWidget(),
              Container(
                padding: EdgeInsets.only(
                    right: 9.0, left: 180.0, top: 9.0, bottom: 9.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    border: Border.fromBorderSide(borderSide),
                    color: white),
                width: 650.0 / 2,
                height: 60,
                child: AllButtons(
                  allBtn: false,
                  shop: true,
                ),
              ),
            ],
          ),
        ),
        Custom_Action_Bar(
          title: 'AIF',
          hasBackArrow: false,
          newPage: LandingPage(),
        ),
      ]),
    );
  }
}
