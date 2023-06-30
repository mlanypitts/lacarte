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

  bool _searchVisible = false;

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
                                      setState(() {
                                        _searchVisible = true;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _searchVisible,
                                child: Container(
                                  width: 306,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.redAccent,
                                  ),
                                  child: TextField(
                                    style: const TextStyle(color: Colors.white, fontSize: 22),
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.only(left: 20, right: 10),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _searchVisible = false;
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                      hintText: 'Search...',
                                      hintStyle: const TextStyle(color: Colors.white, fontSize: 22),
                                      contentPadding: const EdgeInsets.all(22),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      // Do something
                                    },
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ],
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