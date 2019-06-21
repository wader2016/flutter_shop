import 'package:dio/dio.dart';
import 'package:flutter_shop/data/maintenance.dart';
import 'dart:async';
import 'dart:io';
import '../config/api_url.dart';

Future getSwiperData() async {

  try {
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencodeed");

    Response response = await dio.get(homePageUrl['swiperData']);
    if (response.statusCode == 200) {
      return response.data;
    }
    else {
      throw Exception('请求数据错误');
    }
  } catch(e) {
    print("请求数据错误 =====> $e");
  }
}

Future getMaintenanceList() async {
  try {
    List<MaintenanctItem> list = List();
    Response response = await Dio().get(apiUrl + 'maintenanceList');
    if (response.statusCode == 200) {
      final json2 = response.data['data']['list'];
      if (json2 != null) {
        //  list.add(value)
        for (var item in json2) {
          list.add(MaintenanctItem(item));
        }
      }
    }
    return list;
  } catch (e) {
    print('数据请求错误');
  }
}
