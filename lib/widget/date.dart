import 'package:flutter/material.dart';

import '../constants.dart';

class MyDate extends StatefulWidget {
  @override
  State<MyDate> createState() => _MyDateState();
}

class _MyDateState extends State<MyDate> {
  @override
  DateTime pickedDate = DateTime.now();

  late TimeOfDay time;

  @override
  void initState() {
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDate: pickedDate,
      );
      if (date != null)
        setState(() {
          pickedDate = date;
        });
    }

    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        margin: EdgeInsets.only(top: 12.0),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: lightseagreen,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        width: 300.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date:  ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
              style: TextStyle(fontSize: 16.0),
            ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
