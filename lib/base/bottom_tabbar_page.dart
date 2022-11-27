import 'package:flutter/material.dart';
import 'package:zhihu_app/pages/hot_page.dart';

import '../pages/recommend_page.dart';


class BottomMainTabBar extends StatefulWidget {
  const BottomMainTabBar({Key? key}) : super(key: key);

  @override
  State<BottomMainTabBar> createState() => _BottomMainTabBarState();
}

class _BottomMainTabBarState extends State<BottomMainTabBar> {
  int _currentIdx = 0;
  final List _titles = ["热榜","推荐",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
           _titles[_currentIdx],
         ),
      ),
      body: _currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:  _currentIdx,
        onTap: (idx){
          setState(() {
            _currentIdx = idx;
          });

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "热榜"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.cached),
              label: "推荐"
          ),
        ],
      ),
    );
  }

  Widget _currentPage() {

    return _currentIdx == 0 ? const HotPage(title: 'title') : const RecommendPage();
  }
}





