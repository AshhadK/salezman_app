import 'package:flutter/material.dart';
import '../constants.dart';
import '../tabs/custom_action_bar.dart';
import '../widget/custom_btn.dart';
import '../widget/dropdown_widget.dart';
import 'home_page.dart';

class Process extends StatefulWidget {
  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  final items = ["Select Process", "All Customers", "Single Customers"];

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
                      Text("Process Tab"),
                      DropdownWidget(
                        width: 435.0 / 2,
                        marginTop: 0,
                        dropdownvalue: items[0],
                        items: items,
                        horizontalPadding: 24.0,
                        textSyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomBtn(
                    text: 'Process',
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
              title: 'Process',
              hasBackArrow: true,
              newPage: HomePage(),
            ),
          ],
        ),
      ),
    );
  }
}
