import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_assignment/Stores/menu_store.dart';
import 'package:restaurant_assignment/repositories/menu_repository.dart';
import 'package:restaurant_assignment/screens/login_page.dart';

void main() {
  runApp(const MyApp());
  GetIt getIt = GetIt.instance;

  getIt.registerSingletonAsync<MenuRepository>(() async {
    final repo = MenuRepository();
    return repo;
  });

  getIt.registerSingletonAsync<MenuStore>(() async {
    final store = MenuStore();
    return store;
  }, dependsOn: [MenuRepository]);
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
        'fr_FR': {
          'title': "Bonjour !",
          'title_one': "Où voulez-vous manger \n aujourd'hui ?"
        },
        'en_US': {
          'title': "Hello !",
          'title_one': "Where do you want to eat \n today ?"
        }
      },
      home: LoginScreen(),
    );
  }
}
