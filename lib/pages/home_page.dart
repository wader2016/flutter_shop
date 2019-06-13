import 'package:flutter/material.dart';
import 'dart:convert';
import '../service/home_service.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: FutureBuilder(
        future: getSwiperData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {

            var data = snapshot.data;
//            print(data);
            List<Map> swiperList = (data['data']['projects'] as List).cast();
            print(swiperList);
            return Column(
                children: <Widget>[
                  SwiperList(swiperList: swiperList),
                ],
            );

          }
          else {
            return Center(
              child: Text('loading...'),
            );
          }
        },
      )
    );
  }
}
// 轮播组件
class SwiperList extends StatelessWidget {

  final List swiperList;
  SwiperList({this.swiperList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400.0),
      width: ScreenUtil().setWidth(750.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperList[index]['imageUrl']}", fit: BoxFit.cover);
        },
        itemCount: swiperList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      )
    );
  }
}

//
