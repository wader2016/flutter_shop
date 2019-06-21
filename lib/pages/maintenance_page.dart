import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shop/data/maintenance.dart';
import 'package:flutter_shop/service/home_service.dart';

class MaintenanceInfo extends StatefulWidget {
  MaintenanceInfo({Key key}) : super(key: key);

  _MaintenanceInfoState createState() => _MaintenanceInfoState();
}

class _MaintenanceInfoState extends State<MaintenanceInfo> {

  List<MaintenanctItem> list;
  @override
  void initState() {
    super.initState();
    getMaintenanceList().then((data) {
      setState(() {
        list = data;
      });
    });
  }

  Color _randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }

  Widget _buildPanelList() {
    if (list != null) {
      return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            list[index].isExpanded = !isExpanded;
          });
        },
        children: list.map<ExpansionPanel>((item) {
          return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.brightness_1, size: 12.0, color:  _randomColor()),
                          SizedBox(width: 8.0,),
                          Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(item.desc, style: TextStyle(color: Colors.lightBlue))
                    ],
                  ),
                );
              },
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: item.content.map((l) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(l.name, style: TextStyle(color: Colors.lightBlue)),
                    );
                  }).toList()
              ),
              isExpanded: item.isExpanded
          );
        }).toList(),
      );
    }
    else {
      return Center(
        child: Text('loading...'),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('保养规范介绍'),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(16.0),
              child: _buildPanelList()
          ),
        )
    );
  }
}