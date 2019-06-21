import 'package:flutter/material.dart';
import '../service/home_service.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'amp_map.dart';
import 'car_detail.dart';
import 'maintenance_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// AutomaticKeepAliveClientMixin 保持页面状态  重写 wantKeepAlive 为true
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getSwiperData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              List<Map> swiperList = (data['data']['projects'] as List).cast();

              List navigatorList = (data['data']['navigatorLists'] as List).cast();

              List<Map> carList = (data['data']['carList'] as List).cast();

              return Column(
                children: <Widget>[
                  SwiperList(swiperList: swiperList),
                  NavigatorList(navigatorList: navigatorList),
                  CarList(carList: carList)
                ],
              );
            }
            else {
              return Center(
                child: Text('loading...'),
              );
            }
          },
        ),
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
      onTap: () {
        switch (item) {
          case '新开网页':
            Navigator.of(context).pushNamed('/webview');
            break;
          case '高德地图':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AmpMap()
                )
            );
            break;
          case '折叠菜单':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MaintenanceInfo()
                )
            );
            break;
        }
      },
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
        physics: NeverScrollableScrollPhysics(),
        children: navigatorList.map((item) {
          return _gridViewBuild(context, item);
        }).toList(),
      ),
    );
  }
}

// 列表组件
class CarList extends StatelessWidget {
  final List carList;
  const CarList({Key key, this.carList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: carList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Column(
                  children: <Widget>[
                    CustomListItem(
                      name: '${carList[index]['name']}',
                      price: '${carList[index]['price']}',
                      desc: '${carList[index]['desc']}',
                      thumbnail: Image.network('${carList[index]['imageUrl']}', fit: BoxFit.fill),
                    ),
                    Divider()
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetail(car: carList[index]),
                      )
                  );
                },
              );
            }
        ),
      );

  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.name,
    this.price,
    this.desc,
  });

  final Widget thumbnail;
  final String name;
  final String price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _CarDescription(name: name, price: price, desc: desc),
          )
        ],
      ),
    );
  }

}

class _CarDescription extends StatelessWidget {
  const _CarDescription({Key key, this.name, this.price,this.desc}) : super(key: key);

  final String name;
  final String price;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0
                )
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            Text(desc, style: TextStyle(fontSize: 10.0), overflow: TextOverflow.ellipsis,),
            Text(price, style: TextStyle(
                color: Colors.red,fontSize: 14.0
            ))
          ],
        ),
      ),
    );
  }
}
