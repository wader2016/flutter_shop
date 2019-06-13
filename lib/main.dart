import 'package:flutter/material.dart';
import 'pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'SHOP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amberAccent
        ),
        home: IndexPage(),
      ),
    );
  }
}
