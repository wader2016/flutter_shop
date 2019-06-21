import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/counter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  // 将counter对象添加到providers
  providers..provide(Provider<Counter>.value(counter));
 // ProviderNode封装了InheritWidget，并且提供了 一个providers容器用于放置状态。
  runApp(ProviderNode(child: MyApp(), providers: providers));

}

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
//        home: IndexPage(),
        routes: {
          '/': (_) => IndexPage(),
          '/webview': (_) => WebviewScaffold(
              url: 'https://flutterchina.club/',
              appBar: AppBar(
                title: Text('内部打开网页'),
              ),
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
          )
        },
      ),
    );
  }
}
