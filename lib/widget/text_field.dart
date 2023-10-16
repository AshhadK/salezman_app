import 'package:flutter/material.dart';

import '../../constants.dart';

class LabelText extends StatefulWidget {
  var labelText;
  double height;
  TextStyle style;
  Color color;

  LabelText(
      {required this.labelText,
      required this.style,
      required this.height,
      required this.color});
  @override
  State<LabelText> createState() => _LabelTextState();
}

class _LabelTextState extends State<LabelText> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: widget.color, width: 2.0),
        borderRadius: BorderRadius.circular(24.0),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        widget.labelText,
        style: widget.style,
      ),
    );
  }
}
