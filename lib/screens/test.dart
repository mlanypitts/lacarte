import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_assignment/Stores/map_store.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../widgets/currentLocation_widget.dart';
import '../widgets/customMarker_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  MapStore mapStore = MapStore();

  String defaultLanguage = 'FR';

  final TextEditingController searchController = TextEditingController();

  final Completer<GoogleMapController> _controller = Completer();


  void _onMapLoaded(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _goToLocation(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 14.0,
        ),
      ),
    );
  }

  double getDistance(lat1, lon1, lat2, lon2) {
    var rad = 0.017453292519943295;
    var cosine = cos;
    var a = 0.5 -
        cosine((lat2 - lat1) * rad) / 2 +
        cosine(lat1 * rad) * cosine(lat2 * rad) * (1 - cosine((lon2 - lon1) * rad)) / 2;

    return 12742 * asin(sqrt(a));
  }

  initMarkers() async {
    mapStore.markers = {};

    final actualLocation = mapStore.myCurrentPosition!;

    final List<Marker> totalMarkers = [
      Marker(
        markerId: const MarkerId("1"),
        position: mapStore.myCurrentPosition!,
        icon: await const MarkerWidgetCurrentLocation().toBitmapDescriptor(
            logicalSize: const Size(250, 250),
            imageSize: const Size(250, 250)
        ),
      ),
      Marker(
        markerId: const MarkerId("2"),
        position: const LatLng(-20.247615365905244, 57.480911514958166),
        icon: await const MarkerWidget(name: "Cuisto").toBitmapDescriptor(
            logicalSize: const Size(250, 250),
            imageSize: const Size(250, 250)
        ),
      ),
      Marker(
        markerId: const MarkerId("3"),
        position: const LatLng(-20.225384368555787, 57.49679351515807),
        icon: await const MarkerWidget(name: "Cuisto 1").toBitmapDescriptor(
            logicalSize: const Size(250, 250),
            imageSize: const Size(250, 250)
        ),
      ),
      Marker(
        markerId: const MarkerId("4"),
        position: const LatLng(-20.226810783215416, 57.467999938390335),
        icon: await const MarkerWidget(name: "La Carte").toBitmapDescriptor(
            logicalSize: const Size(250, 250),
            imageSize: const Size(250, 250)
        ),
      ),
      Marker(
        markerId: const MarkerId("5"),
        position: const LatLng(-20.279287131761336, 57.50617183946224),
        icon: await const MarkerWidget(name: "La Carte 1").toBitmapDescriptor(
            logicalSize: const Size(250, 250),
            imageSize: const Size(250, 250)
        ),
      )
    ];

    final List<Marker> nearbyMarkers = [];

    for (final marker in totalMarkers) {
      final double distance = getDistance(
        actualLocation.latitude,
        actualLocation.longitude,
        marker.position.latitude,
        marker.position.longitude,
      );

      if (distance <= 3.0) {
        nearbyMarkers.add(marker);
      }
      print(distance);
    }
    mapStore.markers.addAll(nearbyMarkers);
    _goToLocation(mapStore.myCurrentPosition!);
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayoutInit);
  }

  Future<void> _afterLayoutInit(_) async {
    if (mounted) {
      mapStore.checkLocationPermission().whenComplete(() => initMarkers());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      onMapCreated: _onMapLoaded,
                      initialCameraPosition: mapStore.initialPosition,
                      markers: mapStore.markers,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(72.0),
                        bottomRight: Radius.circular(72.0),
                      ),
                      border: Border.all(color: Colors.black54.withOpacity(1.0), width: 1.4),
                    ),
                    width: 400,
                    height: 200,
                  ),
                  Positioned(
                    left: 46,
                    top: 54,
                    child: Text('title'.tr,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 284, top: 50),
                    child: Row(
                      children: [
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.language_rounded, color: Colors.orangeAccent, size: 22),
                          onSelected: (language) {
                            switch (language) {
                              case 'EN':
                                Get.updateLocale(const Locale('en', 'US'));
                                defaultLanguage = language;
                                break;
                              case 'FR':
                                Get.updateLocale(const Locale('fr', 'FR'));
                                defaultLanguage = language;
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>> [
                            const PopupMenuItem(
                              value: 'EN',
                              child: Text('English'),
                            ),
                            const PopupMenuItem(
                              value: 'FR',
                              child: Text('French'),
                            ),
                          ],
                        ),
                        Text(defaultLanguage,
                          style: const TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 46,
                    top: 100,
                    child: Text('title_one'.tr,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 46, top: 174),
                        child: Row(
                          children: [
                            Stack(
                                children: [
                                  Visibility(
                                    visible: true,
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.black54.withOpacity(1.0),
                                        child: const Icon(Icons.search, size: 24, color: Colors.white,),
                                        onPressed: () {
                                          mapStore.searchVisible=true;
                                        },
                                      ),
                                    ),
                                  ),
                                  Observer(
                                      builder: (BuildContext context) {
                                        return Visibility(
                                          visible:  mapStore.searchVisible,
                                          child: Container(
                                            width: 274,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(40),
                                              color: Colors.black54.withOpacity(1.0),
                                            ),
                                            child: TextField(
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 18),
                                              controller: searchController,
                                              decoration: InputDecoration(
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      mapStore.searchVisible = false;
                                                    });
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                                hintText: 'Search...',
                                                hintStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                                contentPadding: const EdgeInsets.all(
                                                    14),
                                                border: InputBorder.none,
                                              ),
                                              onChanged: (value) {
                                                // Do something
                                              },
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}