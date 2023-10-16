import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/screens/customer_verification.dart';
import '/widget/input_box.dart';

import '../../constants.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController editingController = TextEditingController();
  bool choice = false;
  @override
  final duplicateItems = List<String>.generate(100, (i) => "Vendor Shop $i");

  var items = <String>[];

  void initState() {
    items.addAll(duplicateItems);

    super.initState();
  }

  @override
  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.only(top: 15.0),
          width: double.infinity,
          height: 75.0 / 2,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.center,
            maxLines: 1,
            onChanged: (value) {
              filterSearchResults(value);
            },
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
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              border: Border.all(
                color: black,
                width: 1,
              ),
              color: white),
          width: 650.0 / 2,
          height: 410,
          margin: EdgeInsets.only(top: 25.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "${index + 1}",
                    style: Constants.btnText,
                  ),
                  backgroundColor: darkseagreen,
                ),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  child: GestureDetector(
                    child: Text(items[index]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerVerification()));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
