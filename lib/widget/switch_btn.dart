import 'package:flutter/material.dart';
import '/constants.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'NO';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'YES';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'NO';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Transform.scale(
          scale: 1.5,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: lightseagreen,
            activeTrackColor: Color.fromARGB(130, 32, 178, 171),
            inactiveThumbColor: grey,
            inactiveTrackColor: Color.fromARGB(130, 204, 203, 203),
          )),
      Text(
        '$textValue',
        style: TextStyle(fontSize: 12),
      )
    ]);
  }
}
