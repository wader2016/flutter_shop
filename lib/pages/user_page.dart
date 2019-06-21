import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('个人中心'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.message, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings,color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(
            children: <Widget>[
              _topHeader(),
              _mySettings(),
              _navIcons(),
              _tileList()
            ],
          )
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(16.0),
      color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 32.0),
            child: ClipOval(
              child: Image.network('https://img.mukewang.com/5572c9660001cf1701000100-100-100.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Text('FLUTTER', style: TextStyle(fontSize: ScreenUtil().setSp(40), color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _mySettings() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('个人设置'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _navIcons() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.white,
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _navIcon(Icons.blur_circular, 'title1'),
          _navIcon(Icons.call_missed_outgoing, 'title2'),
          _navIcon(Icons.text_format, 'title3'),
          _navIcon(Icons.remove_circle_outline, 'title4'),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      width: ScreenUtil().setWidth(187),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 32.0),
          Text(title)
        ],
      ),
    );
  }

  Widget _tileList() {
    return Container(
        margin: EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12)
            )
        ),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.person),
                title: Text('昵称'),
                trailing: Icon(Icons.arrow_right)
            ),
            ListTile(
                leading: Icon(Icons.confirmation_number),
                title: Text('电话号码'),
                trailing: Icon(Icons.arrow_right)
            ),
            ListTile(
                leading: Icon(Icons.phone_in_talk),
                title: Text('联系我们'),
                trailing: Icon(Icons.arrow_right)
            )
          ],
        )
    );
  }


}