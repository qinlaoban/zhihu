import 'package:flutter/material.dart';
import 'package:zhihu_app/pages/hot_page.dart';
import 'base/bottom_tabbar_page.dart';
import 'ok_http.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '热榜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomMainTabBar(),
      // home: const MyHomePage(title: '热榜'),
    );
  }



}


