import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_assignment/Stores/map_store.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/currentLocation_widget.dart';
import '../widgets/customMarker_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapStore mapstore = MapStore();
  String defaultLanguage = 'FR';

  final TextEditingController searchController = TextEditingController();


  Future<void> _goToLocation(LatLng latLng) async {
    final GoogleMapController controller = await mapstore.controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 14.0,
        ),
      ),
    );
  }


  initMarkers() async {
    mapstore.markers = {};
    mapstore.markers.add(Marker(
      markerId: const MarkerId("1"),
      position: const LatLng(-20.244861, 57.595066),
      icon: await const MarkerWidget(name: "La Carte").toBitmapDescriptor(
          logicalSize: const Size(250, 250), imageSize: const Size(250, 250)),
    ));
    mapstore.markers.add(Marker(
      markerId: const MarkerId("3"),
      position: const LatLng(-20.252706, 57.482309),
      icon: await const MarkerWidget(name: "La Carte").toBitmapDescriptor(
          logicalSize: const Size(250, 250), imageSize: const Size(250, 250)),
    ));
    mapstore.markers.add(Marker(
      markerId: const MarkerId("2"),
      position: mapstore.myCurrentPosition!,
      icon: await const MarkerWidgetCurrentLocation().toBitmapDescriptor(
          logicalSize: const Size(250, 250), imageSize: const Size(250, 250)),
    ));
 _goToLocation(mapstore.myCurrentPosition!);
    setState(() {});
  }




  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayoutInit);
  }

  Future<void> _afterLayoutInit(_) async {
    if (mounted) {
      mapstore.checkLocationPermission().whenComplete(() => initMarkers());

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                 Container(
                  height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        initialCameraPosition: mapstore.initialPosition,
                        markers:mapstore.markers,
                        onTap: (s) {
                          print(s);
                        },

                      ),
                    )/*;
                  },
                )*/,
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(72.0),
                      bottomRight: Radius.circular(72.0),
                    ),
                  ),
                  width: 400,
                  height: 260,
                ),
                Positioned(
                  left: 46,
                  top: 58,
                  child: Text('title'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 314, top: 62),
                  child: Row(
                    children: [
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.language_rounded, color: Colors.white, size: 30),
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
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 46,
                  top: 124,
                  child: Text('title_one'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 46, top: 220),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Visibility(
                                visible: true,
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.redAccent,
                                    child: const Icon(Icons.search, size: 32, color: Colors.white,),
                                    onPressed: () {
                                      mapstore.searchVisible=true;
                                     /* setState(() {
                                        _searchVisible = true;
                                      });*/
                                    },
                                  ),
                                ),
                              ),
                              Observer(
                                 builder: (BuildContext context) {
                                   return Visibility(
                                     visible:  mapstore.searchVisible,
                                     child: Container(
                                       width: 306,
                                       height: 70,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(
                                             40),
                                         color: Colors.redAccent,
                                       ),
                                       child: TextField(
                                         style: const TextStyle(
                                             color: Colors.white, fontSize: 22),
                                         controller: searchController,
                                         decoration: InputDecoration(
                                           prefixIcon: const Padding(
                                             padding: EdgeInsets.only(
                                                 left: 20, right: 10),
                                             child: Icon(
                                               Icons.search,
                                               color: Colors.white,
                                               size: 32,
                                             ),
                                           ),
                                           suffixIcon: GestureDetector(
                                             onTap: () {
                                               setState(() {
                                                 mapstore.searchVisible = false;
                                               });
                                             },
                                             child: const Padding(
                                               padding: EdgeInsets.symmetric(
                                                   horizontal: 20),
                                               child: Icon(
                                                 Icons.clear,
                                                 color: Colors.white,
                                                 size: 28,
                                               ),
                                             ),
                                           ),
                                           hintText: 'Search...',
                                           hintStyle: const TextStyle(
                                               color: Colors.white,
                                               fontSize: 22),
                                           contentPadding: const EdgeInsets.all(
                                               22),
                                           border: InputBorder.none,
                                         ),
                                         onChanged: (value) {
                                           // Do something
                                         },
                                       ),
                                     ),
                                   );
                                 }),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: ElevatedButton(
                    child: Text('Elevated Button'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontStyle: FontStyle.normal),
                    ),
                    onPressed: () async {
                      mapstore.markers.add(Marker(
                          markerId: const MarkerId("4"),
                          position: const LatLng(-20.262112, 57.543644),
                          icon: await const MarkerWidget(name: " bitch").toBitmapDescriptor(
                          logicalSize: const Size(250, 250), imageSize: const Size(250, 250))
                      ));
                      mapstore.markers.add(Marker(
                          markerId: const MarkerId("5"),
                          position: const LatLng(-20.245206, 57.494697),
                          icon: await const MarkerWidget(name: "JIJI").toBitmapDescriptor(
                              logicalSize: const Size(250, 250), imageSize: const Size(250, 250))
                      ));
                      setState(() {});
                    },
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}