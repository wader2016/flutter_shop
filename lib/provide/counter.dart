import 'package:flutter/material.dart';



/// 数据和业务在这

class Counter with ChangeNotifier {

  int value = 0;

  increment() {
    value++;
    notifyListeners();
  }
}
