import 'package:flutter/material.dart';
import '../tabs/aif.dart';
import '../tabs/home_tab.dart';
import '../tabs/reports_tab.dart.dart';
import '../widget/bottom_tabs.dart';
import 'about_us.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: PageView(
                controller: _tabsPageController,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [HomeTab(), AIFTab(), ReportsTab(), AboutUs()],
              )),
              BottomTabs(
                selectedTab: _selectedTab,
                tabPressed: (num) {
                  _tabsPageController!.animateToPage(num,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic);
                },
              ),
            ]),
      ),
    );
  }
}
