import 'dart:async';
import 'dart:core';
import 'dart:ui';
import 'package:buzz_me/components/display_routes_modal.dart';
import 'package:buzz_me/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:provider/provider.dart';

import '../components/selection_modal.dart';
import '../components/upcoming_notification.dart';
import '../routes/get_routes.dart';
import '../stops/bus_stops.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static String selected = "";
  static List<String> dest = [];
  static List<String> time = [];
  static int len = 0;
  static Map<String, List<dynamic>> routes = {};
  static Map<String, List<dynamic>> times = {};
  static Set<String> stopName = {};

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  //ucc
  static LatLng _location = const LatLng(51.889428, -8.501201);
  int counter = 0;
  final Set<Marker> _markers = {};

  Set<double> lat = {};
  Set<double> lng = {};
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  String time = "";
  List<String> arrivalTimes = [];
  List<String> places = [];


  @override
  void dispose(){
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _customInfoWindowController.googleMapController = controller;
  }

  Future<void> getCurrentLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _location = LatLng(position.latitude, position.longitude);
      });
    }
  }

  void getStations() async {
    for (int i = 0; i < MapScreen.stopName.length; i++) {
      final Uint8List? markerIcon = await getMarkerIcon();
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(lat.elementAt(i), lng.elementAt(i)),
          icon: BitmapDescriptor.fromBytes(markerIcon!),
          onTap: (){
            _customInfoWindowController.addInfoWindow!(Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              MapScreen.stopName.elementAt(i),
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              MapScreen.selected = MapScreen.stopName.elementAt(i);

                              // List<String> upcomingDest = UpcomingNotification.destination;
                              List<String> upcomingDest = UpcomingNotification.destination;
                              // List<dynamic> vals = [];
                              // if(routes.containsKey(MapScreen.selected)){
                              //   routes.forEach((key, val){
    List<String> vals = [];
    List<String> temp = [];
    List<String> paths = [];

    if(MapScreen.routes.containsKey(MapScreen.selected)){
      MapScreen.routes.forEach((key, val){
    for(var item in val){
    for(var subitem in item){
    if(subitem is List){
    if(key == MapScreen.selected) {
    paths = [subitem.last];
    temp.add(subitem.last);
    places = temp;
    MapScreen.len = 2;
    }} else {
    if(key == MapScreen.selected){
    paths = val.last.cast<String>();
    vals = [val.last.last];
    places = vals;
    MapScreen.len = vals.length;}
    }}
                                  if(key == MapScreen.selected){
  // if(key == LocationSearchBar.currentKey){
    for(int i = 0; i <= 1; i++){
            for(var item in MapScreen.times[MapScreen.selected]!){
            if(key == MapScreen.selected)
            {if(item is List){
            for(var subitem in item){
            item = subitem;
            }
            } else {
            item = item;
            }}
            List<int> pre = [];
            if(item is List){
            for(i = 0; i < item.length; i ++){
            pre += [item[i]];
            }
            }else{ pre = [item];}

            for(int i = 0; i < pre.length; i ++){
            int t = pre[i];
            if(key == MapScreen.selected){

            final hours = t ~/ 3600;
            final r = t % 3600;
            final mins = r ~/ 60;
            if(mins >= 0 && mins< 10) {
            time = "$hours:0$mins";
            } else if(hours >= 0 && hours < 10) {
            time = "0$hours:$mins";
            } else if((hours >= 0 && mins >= 0) && (hours < 10 && mins < 10)) {
            time = "0$hours:0$mins";
            }
            SelectionModal.time = time;
            //TimetableScreen.times.add(time);
            if(i == 1){
            arrivalTimes += [time];
            }else{
            arrivalTimes = [time];}}
            }

            // int t = times[stopName.elementAt(i)]![0][0];
            // final hours = t ~/ 3600;
            // final r = t % 3600;
            // final mins = r ~/ 60;
            // if(mins >= 0 && mins< 10) {
            //   time = "$hours:0$mins";
            // } else if(hours >= 0 && hours < 10) {
            //   time = "0$hours:$mins";
            // } else if((hours >= 0 && mins >= 0) && (hours < 10 && mins < 10)) {
            //   time = "0$hours:0$mins";
            // }

            //MapScreen.time = time;
            MapScreen.time = arrivalTimes;
            MapScreen.dest = places;
            print("HERE");
            print(MapScreen.time);
            print(MapScreen.dest);
          //  vals = val.last;
           // vals.add(val[0].last);


            }
            }}}});
                               // print(vals[0][0][0][0].last);

                                //  MapScreen.dest = vals[0][0].last;
                                  SelectionModal.time = time;
                                  String x = MapScreen.selected;
                                  String y = MapScreen.dest[0];

                                  upcomingDest = ["${x} -> ${y}"];
                                 // UpcomingNotification.time.add(time);
                                 // UpcomingNotification.destination.add("${MapScreen.selected} -> ${MapScreen.dest}");

                                    SelectionModal.from = "${MapScreen.selected} -> ${MapScreen.dest}";
                              }
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        DisplayRoutesModal(),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.pink[100]!.withOpacity(0.7),),borderRadius: BorderRadius.circular(12))),
                            minimumSize: MaterialStateProperty.all(const Size(5, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[300]!.withOpacity(0.8)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            elevation: MaterialStateProperty.resolveWith<double>((states) {
                              return 0.0;
                            }),
                          ), child: const Text(
                            'Show Routes',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto-Medium',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),),
                        ],
                      ),
                    ),
                  ),
              ],
            ), LatLng(lat.elementAt(i), lng.elementAt(i)));
          }
        ),
      );
    }
    //update markers
    setState(() {
      _onMapCreated;
    });
  }

  // custom marker image
  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<Uint8List?> getMarkerIcon()  {
    final markerIcon = getBytesFromAsset('assets/images/images.png', 170);
    return markerIcon;
    }

  @override
  void initState() {
    super.initState();
    getRoutes(
        onFailureCallback: () {
          print("ERR: didn'/t get routes");
        },
        onSuccessCallback: (Map<String, List<dynamic>> routesList, timeList) {
          for (var key in routesList.keys) {
            if(!MapScreen.routes.containsKey(key)) {
              MapScreen.routes[key] = [];
              MapScreen.stopName.add(key);
            }
            if (MapScreen.routes.containsKey(key)) {
              MapScreen.routes[key]?.add(routesList[key]);
            }
          }
          for (var key in timeList.keys) {
            if(!MapScreen.times.containsKey(key)) {
              MapScreen.times[key] = [];
            }
            if (MapScreen.times.containsKey(key)) {
              MapScreen.times[key]?.add(timeList[key]);
            }
          }
        }
    );
    getStops(
      onFailureCallback: () {
        print("ERR: didn'/t get stops");
      },
      onSuccessCallback: (List<BusStop> stopsList) {
        for (var stop in stopsList) {
          lat.add(stop.latitude.toDouble());
          lng.add(stop.longitude.toDouble());
          counter += 1;
          getMarkerIcon();
          getStations();
        }},
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:5),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: _location,
                zoom: 15.0,
              ),
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 150,
            offset: 50,
          ),
        ],
      ),
    );
  }
}