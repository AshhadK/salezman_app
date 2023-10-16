import 'package:flutter/material.dart';
import '/constants.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final onPressed;
  final color;
  final TextStyle;
  final bool isLoading;
  final double width;
  CustomBtn(
      {required this.text,
      required this.onPressed,
      required this.isLoading,
      required this.width,
      required this.color,
      this.TextStyle});

  @override
  Widget build(BuildContext context) {
    bool _isLoading = isLoading ? false : true;
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(children: [
            Visibility(
              visible: isLoading ? false : true,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Center(
                child: SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(
                    color: white,
                    strokeWidth: 3.0,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
