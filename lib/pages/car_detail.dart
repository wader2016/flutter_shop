import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetail extends StatelessWidget {
  final Map car;

  CarDetail({this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${car['name']}'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.network('${car['imageUrl']}', height: ScreenUtil().setHeight(320), fit: BoxFit.cover)
          ),
          titleSection(),
          buttonSection(),
          textSection()
        ],
      ),
    );
  }

  // 标题行
  titleSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                      '${car['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                Text('${car['type']}', style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          Text('40')
        ],
      ),
    );
  }

  // 按钮行
  buttonSection() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.grey),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
              label,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
              )
          ),
        )
      ],
    );
  }

  // 文本描述
  textSection() {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Text('${car['desc']}', softWrap: true),
    );
  }
}
