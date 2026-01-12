import 'package:flutter/material.dart';
import 'package:my_project/pages/My/index.dart';
import 'package:my_project/pages/Pro/index.dart';
import 'package:my_project/pages/cart/index.dart';
import 'package:my_project/pages/home/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'title': '首页',
      'icon': 'lib/assets/ic-public-home-normal.png',
      'activeIcon': 'lib/assets/ic-public-home-active.png',
    },
    {
      'title': '分类',
      'icon': 'lib/assets/ic-public-pro-normal.png',
      'activeIcon': 'lib/assets/ic-public-pro-active.png',
    },
    {
      'title': '购物车',
      'icon': 'lib/assets/ic-public-cart-normal.png',
      'activeIcon': 'lib/assets/ic-public-cart-active.png',
    },
    {
      'title': '我的',
      'icon': 'lib/assets/ic-public-my-normal.png',
      'activeIcon': 'lib/assets/ic-public-my-active.png',
    },
  ];
  List<BottomNavigationBarItem> _getTabBarWidgets() {
    return List.generate(_pages.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_pages[index]['icon'], width: 30, height: 30),
        activeIcon: Image.asset(
          _pages[index]['activeIcon'],
          width: 30,
          height: 30,
        ),
        label: _pages[index]['title'],
      );
    });
  }

  List<Widget> _getTabBarPages() {
    return [HomeViewState(), ProViewState(), CartViewState(), MyViewState()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getTabBarPages()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: _getTabBarWidgets(),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
