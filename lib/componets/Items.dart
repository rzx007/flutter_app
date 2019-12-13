import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:flutter_app/views/second/detail.dart';

// 组合小组件成item
class Items extends StatelessWidget {
  final article;
  final Color textColor;
  const Items({Key key, @required this.article, this.textColor: Colors.grey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(2.0),
        child: new Card(
          child: new Padding(
            padding: new EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                            url: article['url'], title: article['title']),
                        fullscreenDialog: false));
                print(article);
              },
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      article['content'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.topLeft,
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),
                  // 三个平均分配的横向图标文字
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "980"),
                      _getBottomItem(Icons.link, "1000"),
                      _getBottomItem(Icons.subject, "1000"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// 小组件封装
_getBottomItem(IconData icon, String text) {
  return new Expanded(
    flex: 1,
    child: new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, size: 16.0, color: Colors.grey),
          new Padding(
            padding: new EdgeInsets.only(left: 5.0),
          ),
          new Text(
            text,
            style: new TextStyle(color: Colors.grey, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    ),
  );
}
