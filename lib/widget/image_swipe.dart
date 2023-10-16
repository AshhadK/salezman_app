import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  @override
  State<ImageSwipe> createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  static const IconData backArrow = Icons.arrow_back_ios_new_sharp;
  int _selectedPage = 0;
  final List imageList = [
    'assets/images/img 1.png',
    'assets/images/img 2.png',
    'assets/images/img 3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      // padding: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(color: Color.fromARGB(100, 32, 178, 171)),
      width: double.infinity,
      height: 381 / 2,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num) {
              setState(() {
                _selectedPage = num;
              });
            },
            children: [
              for (var i = 0; i < imageList.length; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  child: Image.asset(
                    imageList[i],
                    fit: BoxFit.fitHeight,
                  ),
                ),
            ],
          ),
          Positioned(
              bottom: ((381 / 2) / 2) - 10,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      backArrow,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 20.0,
                    ),
                    onPressed: () => {_selectedPage--},
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: IconButton(
                      icon: Icon(
                        backArrow,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 20.0,
                      ),
                      onPressed: () => {_selectedPage++},
                    ),
                  ),
                ],
              )),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < imageList.length; i++)
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(120, 0, 0, 0),
                        borderRadius: BorderRadius.circular(12.0)),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: _selectedPage == i ? 45.0 : 20.0,
                    height: 10.0,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
