import 'package:flutter/material.dart';

import '../../constants.dart';

class InputText extends StatelessWidget {
  var labelText;
  bool maxLines;
  double height;
  bool isPasswordField;
  Function(String) onChanged;
  Function(String) onSubmitted;
  FocusNode focusNode;
  TextInputAction textInputAction;
  bool disable;

  InputText(
      {required this.labelText,
      required this.maxLines,
      required this.height,
      required this.disable,
      required this.isPasswordField,
      required this.focusNode,
      required this.onChanged,
      required this.onSubmitted,
      required this.textInputAction});
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      height: height,
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        enabled: !disable,
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: maxLines ? 10 : 1,
        controller: editingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightseagreen, width: 2.0),
            borderRadius: BorderRadius.circular(24.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: lightseagreen, width: 2.0),
            borderRadius: BorderRadius.circular(24.0),
          ),
          hintText: labelText,
          labelText: labelText,
        ),
      ),
    );
  }
}
