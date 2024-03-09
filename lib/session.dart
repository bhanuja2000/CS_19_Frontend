import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  double? latitude;
  double? longitude;
  String address = '';

  void getLocation() async {
    var location = Location();
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    if (serviceEnabled) {
      var currentLocation = await location.getLocation();
      setState(() {
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
      });

      print('Latitude: $latitude, Longitude: $longitude');

      // Call the method to get the address from Google Maps Geocoding API
      getAddressFromApi(latitude!, longitude!);
    }
  }

  Future<void> getAddressFromApi(double lat, double long) async {
    final apiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedBody = json.decode(response.body);
      final results = decodedBody['results'];

      if (results != null && results.isNotEmpty) {
        final firstResult = results[0];
        final formattedAddress = firstResult['formatted_address'];

        setState(() {
          address = formattedAddress;
        });

        print('Address: $address');
      }
    } else {
      print('Failed to load data from Google Maps API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              getLocation();
            },
            child: const Text("Click"),
          ),
          if (latitude != null && longitude != null)
            Text('Latitude: $latitude, Longitude: $longitude'),
          if (address.isNotEmpty) Text('Address: $address'),
        ],
      ),
    );
  }
}
