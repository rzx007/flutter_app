// 本地存储
import 'package:shared_preferences/shared_preferences.dart';

setInts(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

getInts(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int themeIndex = prefs.getInt(key);
  // print(themeIndex);
  return null == themeIndex ? 0 : themeIndex;
}
