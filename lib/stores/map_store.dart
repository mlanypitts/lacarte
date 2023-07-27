import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

part 'map_store.g.dart';

class MapStore = _MapStore with _$MapStore;

abstract class _MapStore with Store {

  @observable
  Set<Marker> markers = {};

  @observable
  LatLng? myCurrentPosition;

  @observable
  bool searchVisible = false;

  @observable
   CameraPosition initialPosition = const CameraPosition(
    target: LatLng(-20.241965, 57.489610),
    zoom: 14.4746,
  );


  @action
  Future<void> checkLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (status.isDenied) {
      await Permission.locationWhenInUse.request();
    }
    if (status.isGranted) {
      await getCurrentLocation();// wait for get currentlocation to finish
    }
  }

  @action
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      //my marker - current location
      LatLng latLng = LatLng(position.latitude, position.longitude);
      //goToLocation(latLng);
      myCurrentPosition = latLng;
      print("my current location $myCurrentPosition");

    } catch (e) {
      print(e);
    }
  }
}