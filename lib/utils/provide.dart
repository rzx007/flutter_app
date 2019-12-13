import 'package:provide/provide.dart';
import 'package:flutter_app/provide/index.dart';
class Provides {
  static getProvide(context){
    return Provide.value<ThemeProvide>(context);
  }
}
