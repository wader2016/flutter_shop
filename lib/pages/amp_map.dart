import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';

class AmpMap extends StatefulWidget {
  AmpMap({Key key}) : super(key: key);

  _AmpMapState createState() => _AmpMapState();
}

class _AmpMapState extends State<AmpMap> {

  AMapController aMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('高德地图'),
        ),
        body: AMapView(
          onAMapViewCreated: (controller) {
            aMapController = controller;
          },
          amapOptions: AMapOptions(
              compassEnabled: false,
              zoomControlsEnabled: true,
              logoPosition: LOGO_POSITION_BOTTOM_CENTER,
              camera: CameraPosition(
                  target: LatLng(41.851827, 112.801638),
                  zoom: 6
              )
          ),
        )
    );
  }
}
