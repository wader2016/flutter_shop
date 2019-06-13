import 'package:dio/dio.dart';
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
