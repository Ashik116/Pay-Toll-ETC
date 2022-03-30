import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late GoogleMapController _map;
  final CameraPosition _initialposition =
      CameraPosition(target: LatLng(23.770096, 90.408370));
  final List<Marker> markers = [];
  addMarker(cordinate) {
    int id = Random().nextInt(100);
    setState(() {
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialposition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            _map = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate) {
          _map.animateCamera(CameraUpdate.newLatLng(cordinate));
        },
      ),
    );
  }
}
