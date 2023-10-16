import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/landing_page.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../screens/home_page.dart';
import '../widget/dropdown_widget.dart';
import 'customer_info.dart';
import 'order_page.dart';

class PrincipalOrder extends StatefulWidget {
  @override
  State<PrincipalOrder> createState() => _PrincipalOrderState();
}

class _PrincipalOrderState extends State<PrincipalOrder> {
  final items = ["SELECT PRINCIPAL", "GSK", "GSK CONSUMER"];

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
                      Text("Principal"),
                      DropdownWidget(
                        width: 435.0 / 2,
                        marginTop: 0,
                        dropdownvalue: items[0],
                        items: items,
                        horizontalPadding: 24.0,
                        textSyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(
                        text: 'Home',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        isLoading: false,
                        width: 120.0,
                        color: grey,
                        TextStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                      ),
                      CustomBtn(
                        text: 'Create Order',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderPage()));
                        },
                        isLoading: false,
                        width: 130.0,
                        color: lightseagreen,
                        TextStyle: Constants.btnText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Custom_Action_Bar(
              title: 'Principal Order',
              hasBackArrow: true,
              newPage: CustomerInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
