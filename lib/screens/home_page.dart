import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String defaultLanguage = 'FR';

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
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
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: FloatingActionButton(
                          backgroundColor: Colors.redAccent,
                          child: const Icon(Icons.search, size: 32, color: Colors.white,),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
    );
  }
}