import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar:  new AppBar(
        ///这个title是一个Widget
        title: new Text("我的"),
      ),
    );
  }
}