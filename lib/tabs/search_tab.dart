import 'package:flutter/material.dart';
import '/screens/landing_page.dart';

import 'custom_action_bar.dart';

class Search_Tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Text("Search Tab")),
          Custom_Action_Bar(
            title: 'Search',
            hasBackArrow: false,
            newPage: LandingPage(),
          ),
        ],
      ),
    );
  }
}
