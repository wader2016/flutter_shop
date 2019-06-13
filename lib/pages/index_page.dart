import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'user_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> navigatorBars = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('中心')
    )
  ];

  final List tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabPages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: navigatorBars,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = tabPages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}

