import 'package:flutter/material.dart';
import '/screens/landing_page.dart';

import 'custom_action_bar.dart';

class SchemesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Text("Schemes Tab")),
          Custom_Action_Bar(
            title: 'Schemes',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      ),
    );
  }
}
