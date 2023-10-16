import 'package:flutter/material.dart';

import '../constants.dart';

class MyCheckBox extends StatefulWidget {
  bool checkBoxVal;
  var text;
  MyCheckBox({required this.checkBoxVal, required this.text});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32.0,
          height: 32.0,
          padding: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
              border: Border.all(color: lightseagreen, width: 3.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Checkbox(
            value: widget.checkBoxVal,
            onChanged: (value) {
              setState(() {
                widget.checkBoxVal = value!;
              });
            },
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10.0),
            width: 90.0,
            child: Text(widget.text)),
      ],
    );
  }
}
