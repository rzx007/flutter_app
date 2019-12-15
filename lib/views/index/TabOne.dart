import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TabOne extends StatefulWidget {
  TabOne();
  @override
  _TabOneState createState() => new _TabOneState();
}

class _TabOneState extends State<TabOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        panel: Center(
          child: Text("这里是抽屉区"),
        ),
        body: Center(
          child: Text("这么是页面区"),
        ),
      ),
    );
  }
}
