import 'package:flutter/material.dart';
import '/constants.dart';

class InputBox extends StatelessWidget {
  final double width;
  final double margin;
  final String hintText;
  final bool isPasswordField;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  InputBox({
    required this.width,
    required this.margin,
    required this.hintText,
    required this.isPasswordField,
    required this.onChanged,
    required this.onSubmitted,
    required this.focusNode,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
      decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: lightseagreen,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(24.0)),
      width: width,
      height: 40.0,
      child: TextField(
        obscureText: isPasswordField,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 97, 93, 93),
              fontStyle: FontStyle.italic),
          border: InputBorder.none,
        ),
        style:
            TextStyle(fontSize: 15.0, color: Color.fromARGB(255, 97, 93, 93)),
      ),
    );
  }
}
