import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:restaurant_assignment/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Restaurant App',
      locale: Locale('fr', 'FR'),
      translationsKeys: {
        'fr_FR': {'title':"Bonjour !",
                  'title_one': "Où voulez-vous jiji \n aujourd'hui ?"},
        'en_US': {'title': "Hello !",
                  'title_one': "Where do you want to eat \n today ?"}
      },
      home: LoginScreen(),
    );
  }
}

