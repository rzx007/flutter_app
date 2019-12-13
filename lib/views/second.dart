import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app/componets/Items.dart';
// import 'package:english_words/english_words.dart';

class Article {
  String title;
  String content;
  String url;
  Article({this.title, this.content, this.url});
}

// 有状态widget
class DemoPage extends StatefulWidget {
  final int nums;

  DemoPage({Key key, @required this.nums}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    super.initState();
    //初始化状态
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    ///一个页面的开始
    ///如果是新页面，会自带返回按键
    return new Scaffold(
      ///背景样式
      backgroundColor: Colors.blueGrey[100],

      ///标题栏，当然不仅仅是标题栏
      appBar: new AppBar(
        ///这个title是一个Widget
        title: new Text("列表"),
      ),
      body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('lib/mock/item.json'),
          builder: (context, snapshot) {
            var newData = json.decode(snapshot.data.toString());
            return new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new Items(article: newData[index]);
              },
              itemCount:newData==null? 0 :newData.length,
            );
          }),

      ///正式的页面开始
      //一个ListView，20个Item
    );
  }
}
