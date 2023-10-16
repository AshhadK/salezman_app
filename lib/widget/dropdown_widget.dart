import 'package:flutter/material.dart';

import '../../constants.dart';

class DropdownWidget extends StatefulWidget {
  double width;
  double marginTop;
  double horizontalPadding;
  TextStyle textSyle;
  String dropdownvalue;
  final List<String> items;
  DropdownWidget(
      {required this.width,
      required this.textSyle,
      required this.dropdownvalue,
      required this.horizontalPadding,
      required this.marginTop,
      required this.items});
  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: lightseagreen,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24.0)),
      width: widget.width,
      height: 75.0 / 2,
      margin: EdgeInsets.only(top: widget.marginTop),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          // Initial Value
          value: widget.dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: widget.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items, style: widget.textSyle),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownvalue = newValue!;
            });
          },
          //empty line
        ),
      ),
    );
  }
}
