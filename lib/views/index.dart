import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_app/views/index/TabOne.dart';
import 'package:flutter_app/views/index/TabTow.dart';
import 'package:flutter_app/views/index/TabThree.dart';
class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  List tabs = ["新闻", "历史", "图片"];
  TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = new TabController(length: tabs.length, vsync: this);
    // 监听tabs的切换
    _tabController.addListener(() {
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      print("index: $index");
      print('previousIndex: $previousIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        //导航栏
        title: Text("全历史"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
            TabOne(), TabTow(), TabThree(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onAdd() {}
}
