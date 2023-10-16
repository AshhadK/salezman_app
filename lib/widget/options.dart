import 'package:flutter/material.dart';
import '/constants.dart';
import '/screens/landing_page.dart';
import '/widget/text_field.dart';
import '../../tabs/custom_action_bar.dart';
import '../../widget/custom_btn.dart';

class OptionsPage extends StatefulWidget {
  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final items = ["Orders", "Status(s)", "AIF(s)"];
  int count = 0;
  String note =
      "All of the Sections, POPs, Cashmemo(s) will be deleted on downloading";
  var input = ["96", "03/05/2022"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Text("Upload and Download Options",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold))),
                Container(
                    width: 330,
                    height: 200,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(24.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < items.length; i++)
                          LabelText(
                            color: lightseagreen,
                            height: 40.0,
                            labelText: "${count} ${items[i]} to upload",
                            style: TextStyle(),
                          ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 20.0),
                          child: CustomBtn(
                            text: "Upload",
                            onPressed: null,
                            isLoading: false,
                            width: 120,
                            color: lightseagreen,
                            TextStyle: Constants.btnText,
                          ),
                        )
                      ],
                    )),
                Container(
                    width: 330,
                    height: 270,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                          color: grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(24.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LabelText(
                          color: lightseagreen,
                          height: 40.0,
                          labelText: "Existing PJP is  ${input[0]}",
                          style: TextStyle(),
                        ),
                        LabelText(
                          color: lightseagreen,
                          height: 40.0,
                          labelText: "Working Date is  ${input[1]}",
                          style: TextStyle(),
                        ),
                        LabelText(
                          color: lightseagreen,
                          height: 80.0,
                          labelText: "NOTE:  ${note}",
                          style: TextStyle(),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 20.0),
                          child: CustomBtn(
                            text: "Download",
                            onPressed: null,
                            isLoading: false,
                            width: 120,
                            color: lightseagreen,
                            TextStyle: Constants.btnText,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Custom_Action_Bar(
            title: 'Options',
            hasBackArrow: true,
            newPage: LandingPage(),
          ),
        ],
      )),
    );
  }
}
