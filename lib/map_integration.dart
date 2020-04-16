import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/*
To add google map
you need to add dependency of google map in pubspec.yaml
copy api key from google console for ios and android and yes make sure you have enable all necessary api service and paste in respective android and ios module
for android you need to add in androidmanifiest.xml
and for ios you need to change in 2 file add api key in AppDelegate.swift and enable google map in Info.plist
*/

class MapIntegration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google map")),
      body: MyMapIntegration(),
    );
  }
}

class MyMapIntegration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyMapIntegrationApp();
  }
}

class MyMapIntegrationApp extends State<MyMapIntegration> {
  var location = new Location();
  GoogleMapController mapController;

  String data = "";
  final TextEditingController controller = TextEditingController();

  final LatLng _center = const LatLng(45.521563, -122.677433);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  /*
  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                  
                  TextField(
        decoration: InputDecoration(hintText: "Type anything"),
        onSubmitted: (String txt) {
          setState(() {
            data = data + "\n" + txt;
            controller.text = "";
          });
        },
        controller: controller,
      )
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(hintText: "Type anything"),
              onSubmitted: (String txt) {
                setState(() {
                  data = data + "\n" + txt;
                  controller.text = "";
                  _getLocation();
                });
              },
              controller: controller,
            ),
          )
        ],
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
      _add(currentLocation);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  void _add(Map<String, double> currentLocation) {
    var markerIdVal = "1";
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        currentLocation["latitude"],
        currentLocation["longitude"],
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }
}
