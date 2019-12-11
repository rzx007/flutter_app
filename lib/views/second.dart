import 'package:flutter/material.dart';
import 'package:flutter_app/componets/Items.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/mock/item.dart';

class Article {
  String title;
  String content;
  String url;
  Article({this.title, this.content,this.url});
}

// 有状态widget
class DemoPage extends StatefulWidget {
  final int nums;
  final List<Article> articles = result.map((item)=>new Article(
      title: item['title'] ,
      content: item['content'],
      url: item['url'],
    )).toList();
  
  // new List.generate(
  //   10,
  //   (i) => new Article(
  //     title: 'Article $i',
  //     content: 'Article $i: The quick brown fox jumps over the lazy dog.',
  //   ),
  // );
  
  DemoPage({Key key, @required this.nums}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _counter;
  List articles;


  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.articles.length;
    articles =  widget.articles;
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

      ///正式的页面开始
      ///一个ListView，20个Item
      body: new ListView.builder(
        itemBuilder: (context, index) {
          final wordPair = new WordPair.random();
          return new Items(article: articles[index]);
        },
        itemCount: _counter,
      ),
    );
  }
}
