import 'package:flutter/material.dart';
import '/constants.dart';
import '../../tabs/custom_action_bar.dart';
import '../screens/landing_page.dart';
import '../widget/all_btns.dart';
import '../widget/dropdown_widget.dart';
import '../widget/search_widget.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => new _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
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
                    allBtn: true,
                    shop: true,
                  )),
            ],
          ),
        ),
        Custom_Action_Bar(
          title: 'Home',
          hasBackArrow: false,
          newPage: LandingPage(),
        ),
      ]),
    );
  }
}
