import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_app/provide/index.dart';
import 'package:flutter_app/utils/provide.dart';
import 'package:flutter_app/views/mine/ThemeSet.dart';

class MinePage extends StatelessWidget {
  final List tabs = ["主题", "收藏", "历史"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          ///这个title是一个Widget
          title: new Text("我的"),
        ),
        floatingActionButton: FloatingActionButton(
            //悬浮按钮
            child: Icon(Icons.add),
            onPressed: () {
              log('message');
              Provides.getProvide(context).setTheme(2);
            }),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _createMinePageItem(context, tabs[index]);
          },
          itemCount: tabs.length,
        ));
  }
}

// Provide.value<MyProvide>(context).setTheme(1);
// createItems
_createMinePageItem(context, String text) {
  return new Container(
    margin: EdgeInsets.only(left: 5.0, right: 5.0),
    height: 50.0,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: .7))),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () { //点击跳转
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThemeSetPage(), fullscreenDialog: false));
      },
      child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: new Text(
                  text,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
                flex: 1,
              ),
              new Icon(Icons.star, size: 16.0, color: Colors.grey),
            ],
          )),
    ),
  );
}

