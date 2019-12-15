import 'package:flutter/material.dart';

import 'dart:io'; //提供Platform接口
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle

// 引入主题相关
import 'package:provide/provide.dart';
import 'package:flutter_app/provide/index.dart';
import 'package:flutter_app/provide/ThemeClass.dart';
import 'package:flutter_app/provide/shared_preferences.dart';

import 'views/index.dart';
import 'views/second.dart';
import 'views/mine.dart';

void main() async {
  //初始化
  var theme = ThemeProvide();
  var providers = Providers();
  //将theme加到providers中
  providers..provide(Provider.function((context) => theme));
  int themeIndex = await getInts('ThemeIndex');
  runApp(ProviderNode(
    providers: providers,
    child: MyApp(themeIndex),
  ));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前       MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final int themeIndex;
  MyApp(this.themeIndex);
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(
      builder: (context, child, theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              iconTheme: IconThemeData(
                  color: YColors.themeColor[theme.getValue == null
                      ? themeIndex
                      : theme.getValue]["colorAccent"]),
              primaryColor: YColors.themeColor[theme.getValue == null
                  ? themeIndex
                  : theme.getValue]["primaryColor"]),
          home: BottomNav(themeIndex: themeIndex),
        );
      },
    );
  }
}

class BottomNav extends StatefulWidget {
  final int themeIndex;
  BottomNav({Key key, this.themeIndex}) : super(key: key);
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Widget> views = [Index(), DemoPage(nums: 6), MinePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,

        onTap: _onItemTapped,
      ),
      body: views[_selectedIndex],
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }
}
