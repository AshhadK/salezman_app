import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  int? selectedTab;
  final Function(int) tabPressed;
  BottomTabs({required this.selectedTab, required this.tabPressed});
  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTabs = 0;
  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab ?? 0;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 204, 203, 203),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomTabBtn(
                  iconName: Icons.home,
                  selected: _selectedTabs == 0 ? true : false,
                  onPressed: () {
                    widget.tabPressed(0);
                  }),
              BottomTabBtn(
                  iconName: Icons.schedule_outlined,
                  selected: _selectedTabs == 1 ? true : false,
                  onPressed: () {
                    widget.tabPressed(1);
                  }),
              BottomTabBtn(
                  iconName: Icons.report,
                  selected: _selectedTabs == 2 ? true : false,
                  onPressed: () {
                    widget.tabPressed(2);
                  }),
              BottomTabBtn(
                  iconName: Icons.account_box,
                  selected: _selectedTabs == 3 ? true : false,
                  onPressed: () {
                    widget.tabPressed(3);
                  })
            ],
          )),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  IconData? iconName;
  final bool selected;
  final onPressed;
  BottomTabBtn(
      {required this.selected,
      required this.onPressed,
      required this.iconName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: selected ? Color(0xFFF20b2aa) : Colors.transparent,
        width: 4.0,
      ))),
      child: IconButton(
        icon: Icon(iconName),
        iconSize: 28.0,
        color: selected ? Color(0xFFF20b2aa) : Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
