import 'package:flutter/material.dart';

import '../../constants.dart';
import '../screens/av_questions.dart';
import '../screens/collections.dart';
import '../screens/dsl.dart';
import '../screens/home_page.dart';
import '../screens/landing_page.dart';
import '../screens/process_page.dart';
import '../screens/view_n_edit.dart';
import 'custom_btn.dart';

class AllButtons extends StatelessWidget {
  late bool allBtn;
  late bool shop;
  AllButtons({
    required this.allBtn,
    required this.shop,
  });

  @override
  Widget build(BuildContext context) {
    return allBtn
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBtn(
                  text: shop ? "Process" : "A / V",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                shop ? Process() : AVQuestions()));
                  },
                  isLoading: false,
                  color: grey,
                  width: 180 / 2,
                  TextStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
                CustomBtn(
                  text: shop ? "Veiw / Edit" : "Collection",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                shop ? ViewNEdit() : Collections()));
                  },
                  isLoading: false,
                  color: grey,
                  TextStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  width: 180 / 2,
                ),
                CustomBtn(
                  text: shop ? "More" : "DSL",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                shop ? LandingPage() : DSL()));
                  },
                  isLoading: false,
                  color: grey,
                  width: 180 / 2,
                  TextStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
              ],
            ),
          )
        : Container(
            // padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 9.0),

            child: CustomBtn(
              text: "Cancel Orders",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              isLoading: false,
              color: grey,
              width: 0,
              TextStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ),
          );
  }
}
