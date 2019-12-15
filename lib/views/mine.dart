import 'package:flutter/material.dart';
// import 'package:flutter_app/views/mine/ThemeSet.dart';

class MinePage extends StatelessWidget {
  final List tabs = ["主题", "收藏", "历史"];
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _createMinePageItem(context, tabs[index]);
          },
          itemCount: tabs.length,
        ));
  }
}

List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
    SliverAppBar(
      centerTitle: true, //标题居中
      expandedHeight: 200.0, //展开高度200
      floating: true, //不随着滑动隐藏标题
      pinned: true, //固定在顶部
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('我的'),
        background: Image.network(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
          fit: BoxFit.cover,
        ),
      ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            print("添加");
          },
        ),
        new IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {
            print("更多");
          },
        ),
      ],
    )
  ];
}

// Provide.value<MyProvide>(context).setTheme(1);
// createItems
Widget _createMinePageItem(context, String text) {
  return new Container(
    margin: EdgeInsets.only(left: 5.0, right: 5.0),
    height: 50.0,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: .7))),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        //点击跳转
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ThemeSetPage(), fullscreenDialog: false));
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
