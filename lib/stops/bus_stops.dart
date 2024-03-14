import 'dart:convert';
import 'package:http/http.dart' as http;

class BusStop {
  final String name;
  final double latitude;
  final double longitude;

  BusStop({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}
//    val stops = mapOf<String,LatLng>(
//        Pair("Dennehy's Cross", LatLng(51.89012,-8.50678)),
//        Pair("Pouladuff", LatLng(51.87329,-8.48676)),
//        Pair("Brookfield", LatLng(51.890247,-8.500054)),
//        Pair("UCC Main Campus", LatLng(51.892137,-8.491714)),
//    )
Future<void> getStops({
  required void Function() onFailureCallback,
  required void Function(List<BusStop>) onSuccessCallback,
}) async {
  try {
    //var response = await http.get(Uri.parse('http://localhost:3000'));
    final List<String> locations = [
      "Dennehy's Cross",
      "UCC Pouladuff Park & Ride",
      "University College Cork",
      "Brookfield Student Accommodation",
      "Black Ash Park & Ride"
    ];
    final List<BusStop> stationsList = [];

    for (int i = 0; i < locations.length; i ++) {
      final String location = locations[i];
      var response = await http.get(
        Uri.parse(
            'https://maps.googleapis.com/maps/api/geocode/json?&address=$location&key=AIzaSyACvY1ZY8DDj3E8htxZE4CHISOtDJv9Rek'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);

        final name = parsed['results'][0]['address_components'][0]['long_name'];
        final lat = parsed['results'][0]['geometry']['location']['lat'];
        final lng = parsed['results'][0]['geometry']['location']['lng'];

        stationsList.add(
          BusStop(
            name: name,
            latitude: lat,
            longitude: lng,
          ),
        );
        onSuccessCallback(stationsList);

      } else {
        onFailureCallback();
      }
    }
  } catch (e) {
    onFailureCallback();
  }
}