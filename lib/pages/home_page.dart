import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: FutureBuilder(
        future: getSwiperData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            List<Map> swiperList = (data['data']['projects'] as List).cast();

            List navigatorList = ['应用1','应用2','应用3','应用4','应用5','应用6'];

            return Column(
                children: <Widget>[
                  SwiperList(swiperList: swiperList),
                  NavigatorList(navigatorList: navigatorList,)
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

// 导航组件

class NavigatorList extends StatelessWidget {

  final List navigatorList;

  NavigatorList({this.navigatorList});

  Widget _gridViewBuild(BuildContext context, item) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4.0,
        child: Container(
          color: Colors.amberAccent,
          child: Center(
            child: Text(item)
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 40.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 4/2,
        padding: EdgeInsets.all(16.0),
        children: navigatorList.map((item) {
          return _gridViewBuild(context, item);
        }).toList(),
      ),
    );
  }
}

