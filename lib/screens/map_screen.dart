import 'dart:async';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../stops/bus_stops.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  //ucc
  static LatLng _location = const LatLng(51.893324, -8.492030);
  int counter = 0;
  final Set<Marker> _markers = {};
  Set<String> stopName = {};
  Set<double> lat = {};
  Set<double> lng = {};

  @override
  void dispose(){
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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
    for (int i = 0; i < stopName.length; i++) {
      final Uint8List? markerIcon = await getMarkerIcon();
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(lat.elementAt(i), lng.elementAt(i)),
          infoWindow: InfoWindow(
            title: stopName.elementAt(i),
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon!),
        ),
      );
    }
    // Call setState to trigger a rebuild and update the markers on the map
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
    getStops(
      onFailureCallback: () {
        print("ERR: didn'/t get stops");
      },
      onSuccessCallback: (List<BusStop> stopsList) {
        for (var stop in stopsList) {
          stopName.add(stop.name.toString());
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
            ),
          ),
        ],
      ),
    );
  }
}