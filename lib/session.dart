// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;

// class Session extends StatefulWidget {
//   const Session({Key? key}) : super(key: key);

//   @override
//   State<Session> createState() => _SessionState();
// }

// class _SessionState extends State<Session> {
//   TextEditingController _searchController = TextEditingController();
//   double? latitude;
//   double? longitude;
//   String address = '';

//   @override
//   void initState() {
//     super.initState();
//     getLocation();
//   }

//   void getLocation() async {
//     var location = Location();
//     var serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }
//     if (serviceEnabled) {
//       var currentLocation = await location.getLocation();
//       setState(() {
//         latitude = currentLocation.latitude;
//         longitude = currentLocation.longitude;
//       });

//       print('Latitude: $latitude, Longitude: $longitude');

//       await getAddressFromApi(latitude!, longitude!);
//     }
//   }

//   Future<void> getAddressFromApi(double lat, double long) async {
//     final apiKey = 'AIzaSyA8DfNNCPm--UmVeJy-AEEoz48_h3Q0td8';
//     final apiUrl =
//         'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apiKey';

//     try {
//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         final decodedBody = json.decode(response.body);
//         //print('Decoded Body: $decodedBody');

//         final results = decodedBody['results'];
//         if (results != null && results.isNotEmpty) {
//           final firstResult = results[0];
//           final formattedAddress = firstResult['formatted_address'];

//           setState(() {
//             address = formattedAddress;
//           });

//           print('Address: $address');
//         } else {
//           print('No results found in the Geocoding API response.');
//         }
//       } else {
//         print('Failed to load data from Google Maps API');
//         print('Response Code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error during API request: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Session')),
//       body: Column(
//         children: [
//           if (latitude != null && longitude != null)
//             Text(
//               'This is Your Location $address',
//               style: TextStyle(fontSize: 14),
//             ),
//           Container(margin: EdgeInsets.all(16), child: _buildSearchBar()),
//           SizedBox(
//             height: 170,
//           ),
//           CircleAvatar(
//             backgroundColor: Colors.blue,
//             radius: 80.0,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//               ),
//               child: Text(
//                 'Start Session',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return TextField(
//       controller: _searchController,
//       decoration: InputDecoration(
//         hintText: 'Add Your Destination...',
//         prefixIcon: Icon(Icons.search),
//         suffixIcon: IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             print(_searchController);
//           },
//         ),
//       ),
//       onChanged: (value) {
//         print(_searchController);
//       },
//     );
//   }
// }

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:textfild/main_page/home_page.dart';
import 'package:textfild/panic_main.dart';

class Session extends StatefulWidget {
  late String jwttoken;
  final String email;
  Session({Key? key, required this.jwttoken, required this.email})
      : super(key: key);

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  TextEditingController _searchController = TextEditingController();
  double? latitude;
  double? longitude;
  String address = '';
  List<String> contacts = [
    'Contact 1',
    'Contact 2',
    'Contact 3'
  ]; // Sample contact list

  @override
  void initState() {
    super.initState();
    getLocation();
  }

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

      await getAddressFromApi(latitude!, longitude!);
    }
  }

  Future<void> getAddressFromApi(double lat, double long) async {
    final apiKey = 'AIzaSyA8DfNNCPm--UmVeJy-AEEoz48_h3Q0td8';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$apiKey';

    try {
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
        } else {
          print('No results found in the Geocoding API response.');
        }
      } else {
        print('Failed to load data from Google Maps API');
        print('Response Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API request: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(jwttoken: widget.jwttoken, email: widget.email),
              )),
        ),
      ),
      body: Column(
        children: [
          if (latitude != null && longitude != null)
            Text(
              'This is Your Location $address',
              style: TextStyle(fontSize: 14),
            ),
          Container(margin: EdgeInsets.all(16), child: _buildSearchBar()),
          SizedBox(height: 170),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 80.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PanicMain(
                              startCountdown: _startCountDown,
                              location: address,
                              lat: latitude ?? 0.0,
                              log: longitude ?? 0.0,
                              email: widget.email,
                            )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                'Start Session',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 40),
          Text(
            'Select contact',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(contacts[index]),
                  onTap: () {
                    // Handle contact selection
                    print('Selected contact: ${contacts[index]}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Add Your Destination...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            print(_searchController);
          },
        ),
      ),
      onChanged: (value) {
        print(_searchController);
      },
    );
  }

  void _startCountDown() {}
}
