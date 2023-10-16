import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widget/custom_btn.dart';
import '/constants.dart';

import '../tabs/custom_action_bar.dart';
import '../widget/dropdown_widget.dart';
import 'home_page.dart';

class ViewNEdit extends StatefulWidget {
  @override
  State<ViewNEdit> createState() => _ViewNEditState();
}

class _ViewNEditState extends State<ViewNEdit> {
  final items = List<String>.generate(10, (i) => "Section $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Section Tab"),
                      DropdownWidget(
                        width: 400.0 / 2,
                        marginTop: 0,
                        dropdownvalue: items[0],
                        items: items,
                        horizontalPadding: 24.0,
                        textSyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomBtn(
                    text: 'Cancel Orders',
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
            Custom_Action_Bar(
              title: 'View / Edit',
              hasBackArrow: true,
              newPage: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
