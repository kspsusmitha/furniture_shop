import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irohub_project/features/shop/gmapshopdetails/Gmap_bottomSheet.dart';
import 'package:location/location.dart';

class googlemap extends StatefulWidget {
  const googlemap({super.key});

  @override
  State<googlemap> createState() => _SofascreenState();
}

class _SofascreenState extends State<googlemap> {
  GmapBottomSheet controller = GmapBottomSheet();
  final Completer<GoogleMapController> _mapcontroller =
      Completer<GoogleMapController>();
  Location _locationcontroller = new Location();
  static const LatLng _pgoogleplex = LatLng(37.42223, -122.0848);
  static const LatLng _noWayhome = LatLng(9.99709, 76.302815);
  LatLng? _current = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getlocationupdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      trafficEnabled: true,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: ((GoogleMapController controller) =>
          _mapcontroller.complete(controller)),
      initialCameraPosition: CameraPosition(target: _pgoogleplex, zoom: 13),
      markers: {
        // Marker(
        //     markerId: MarkerId("_currentLocation"),
        //     icon: BitmapDescriptor.defaultMarker,
        //     position: _current!),
        Marker(
            markerId: MarkerId("_sorcelocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pgoogleplex),
        Marker(
            onTap: () {
              controller.getshopdatas(context);
            },
            markerId: MarkerId("_destionation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _noWayhome),
      },
    ));
  }

  Future<void> _cameraTopostion(LatLng pos) async {
    final GoogleMapController controller = await _mapcontroller.future;
    CameraPosition _newpostion = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newpostion));
  }

  Future<void> getlocationupdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await _locationcontroller.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationcontroller.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationcontroller.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationcontroller.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationcontroller.onLocationChanged
        .listen((LocationData currentlocation) {
      if (currentlocation.latitude != null &&
          currentlocation.longitude != null) {
        setState(() {
          _current =
              LatLng(currentlocation.latitude!, currentlocation.longitude!);

          _cameraTopostion(_current!);
        });
      } else {
        print("erorrr");
      }
    });
  }
}
