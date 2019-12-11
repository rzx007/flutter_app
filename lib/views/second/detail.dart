import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SecondPage extends StatelessWidget {
  final String url;
  final String title;
  const SecondPage({this.url,this.title});
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      url: url,
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true,
    );
  }
}

/* class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('返回上一个页面'),
 onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
 **/
