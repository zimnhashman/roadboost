import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'requestScreen.dart';


Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roadboost',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Customer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final  vehicle = '';
  DateTime now = new DateTime.now();
  List<Marker> allMarkers = [];
  late GoogleMapController mapController;
  static const LatLng showLocation = const LatLng(-17.838129, 31.006380);

  static const LatLng actionBreakdown = const LatLng(-17.8341637, 31.0824784);
  static const LatLng miguelBreakdown = const LatLng(-17.7999056, 31.1280522);
  static const LatLng roadAngels = const LatLng(-17.787937, 31.040438);
  static const LatLng johnkayAuto = const LatLng(-17.782812, 30.988937);
  static const LatLng quicklyRescue = const LatLng(-17.846438, 31.063063);
  static const LatLng towjam = const LatLng(-17.763813, 31.007188);

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myLocation'),
        draggable: false,
        infoWindow:
            InfoWindow(snippet: 'Device Location', title: 'Current Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(-17.8391485, 31.0066393)));

    allMarkers.add(Marker(
      markerId: MarkerId(actionBreakdown.toString()),
      position: actionBreakdown,
      infoWindow:
          InfoWindow(title: 'Action Breakdown Services', snippet: 'Action'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    allMarkers.add(Marker(
      markerId: MarkerId(miguelBreakdown.toString()),
      position: miguelBreakdown,
      infoWindow:
          InfoWindow(title: 'Miguel Breakdown Recovery', snippet: 'Miguel'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    allMarkers.add(Marker(
      markerId: MarkerId(roadAngels.toString()),
      position: roadAngels,
      infoWindow:
          InfoWindow(title: 'Road Angels Pvt Ltd', snippet: 'Road Angels'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    allMarkers.add(Marker(
      markerId: MarkerId(johnkayAuto.toString()),
      position: johnkayAuto,
      infoWindow:
          InfoWindow(title: 'John Kay Auto Recovery', snippet: 'John Kay Auto'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    allMarkers.add(Marker(
      markerId: MarkerId(quicklyRescue.toString()),
      position: quicklyRescue,
      infoWindow:
          InfoWindow(title: 'Quickly Rescue and  Recovery', snippet: 'Quickly'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    allMarkers.add(Marker(
      markerId: MarkerId(towjam.toString()),
      position: towjam,
      infoWindow: InfoWindow(title: 'Towjam Pvt Ltd', snippet: 'TowJam'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  '${now.hour}:${now.minute}:${now.second}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.greenAccent,
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: showLocation,
                    zoom: 11.5,
                  ),
                  markers: Set.from(allMarkers),
                  onMapCreated: _onMapCreated,
                  mapType: MapType.normal,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    highlightColor: Colors.greenAccent,
                    onTap: () {
                    },
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icons8-car-50.png'),
                        ),
                        Text('Car'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    highlightColor: Colors.greenAccent,
                    onTap: () {

                    },
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icons8-scooter-50.png'),
                        ),
                        Text('Motorbike'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    highlightColor: Colors.greenAccent,
                    onTap: () {
                    },
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/icons8-truck-64.png'),
                        ),
                        Text('Truck'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Request())),
                child: Text(
                  'REQUEST HELP',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
