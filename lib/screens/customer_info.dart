import 'package:flutter/material.dart';
import '../widget/text_field.dart';
import '/constants.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';
import '../screens/customer_verification.dart';
import '../screens/home_page.dart';
import '../widget/all_btns.dart';
import 'order_page.dart';
import 'principal_order_page.dart';
import 'principal_program.dart';

class CustomerInfo extends StatefulWidget {
  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  var status = "";
  final items = List<String>.generate(5, (i) => "Item $i");
  late String dropdownvalue;
  var a = ["Address : ", "Code :", "DSL :", "Town :", "Overdue :"];
  var b = [
    "Lorem Ipsum has been the industry",
    "348203401",
    "EFHOWE-ASDH",
    "GHAS MNDI/TMBI",
    "0"
  ];
  var c = ["", "", "DRUG : ", "DSL Renew :", "Expiry :"];
  var d = ["", "", "1214", "NO", "10/02/22", ""];
  String currentStatus = "NOT VISITED-01";
  var labelText = [
    "ORDER - 01",
    "PRINCIPAL ORDER - 01",
    "CLOSE - 01",
    "SUFFICIENT - 01",
    "NO CASH - 01",
    "REFUSE - 01",
    "N/A - 01",
    "NO TIME - 01",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 110 / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 330.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VENDERS’ SHOP NAME",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        CustomBtn(
                            text: "Home",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            isLoading: false,
                            width: 100.0,
                            color: grey),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${a[0]}      ${b[0]}",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var j = 1; j < a.length; j++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < 4; i++)
                              Container(
                                width: i == 0
                                    ? 60
                                    : i == 1
                                        ? 100
                                        : i == 2
                                            ? 70
                                            : i == 3
                                                ? 50
                                                : 0,
                                child: Text(
                                  (i == 0)
                                      ? "${a[j]}"
                                      : (i == 1)
                                          ? "${b[j]}"
                                          : (i == 2)
                                              ? "${c[j]}"
                                              : "${d[j]}",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(24.0)),
                    width: 330,
                    height: 830.0 / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < labelText.length; i++)
                          GestureDetector(
                            child: (i == 8)
                                ? LabelText(
                                    labelText: currentStatus,
                                    style: TextStyle(),
                                    height: 30.0,
                                    color: lightseagreen,
                                  )
                                : LabelText(
                                    labelText: labelText[i],
                                    style: TextStyle(),
                                    height: 30.0,
                                    color: lightseagreen,
                                  ),
                            onTap: () {
                              (i == 0)
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderPage()))
                                  : (i == 1)
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PrincipalOrder()))
                                      : setState(() {
                                          (i == 2)
                                              ? status = "SHOP CLOSED"
                                              : (i == 3)
                                                  ? status = "SUFFECIENT"
                                                  : (i == 4)
                                                      ? status = "CASH NOT PAID"
                                                      : (i == 5)
                                                          ? status =
                                                              "CLIENT REFUSED"
                                                          : (i == 6)
                                                              ? status = "N / A"
                                                              : (i == 7)
                                                                  ? status =
                                                                      "NO TIME"
                                                                  : (i == 8)
                                                                      ? {
                                                                          currentStatus =
                                                                              "VISITED - 01",
                                                                          status =
                                                                              "VISITED - 01"
                                                                        }
                                                                      : status =
                                                                          "";
                                          print(status);
                                          final snackBar = SnackBar(
                                            content: Text(
                                                "Status is '${status}'",
                                                style: TextStyle(color: white)),
                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        });
                            },
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomBtn(
                        text: "Update Location",
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text("Location Updated",
                                style: TextStyle(color: white)),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        isLoading: false,
                        width: 120.0,
                        color: lightseagreen,
                        TextStyle: const TextStyle(
                            fontSize: 13.0,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomBtn(
                        text: "View Principal Program",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrincipalProgram()));
                        },
                        isLoading: false,
                        width: 120.0,
                        color: lightseagreen,
                        TextStyle: const TextStyle(
                            fontSize: 13.0,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 25.0),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Current Status: ${currentStatus}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 20.0),
                      child: AllButtons(
                        allBtn: true,
                        shop: false,
                      )),
                ],
              ),
            ),
          ),
          Custom_Action_Bar(
            title: 'Customer Info',
            hasBackArrow: false,
            newPage: CustomerVerification(),
          ),
        ],
      )),
    );
  }
}
