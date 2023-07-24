import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_assignment/Stores/menu_store.dart';
import '../repositories/menu_repository.dart';
import '../widgets/tabbar_widget.dart';

/*void main(){
  runApp(const MenuInterface());
  GetIt getIt = GetIt.instance;

  getIt.registerSingletonAsync<MenuRepository>(() async {
    final repo = MenuRepository();
    return repo;
  });

  getIt.registerSingletonAsync<MenuStore>(() async {
    final store = MenuStore();
    return store;
  } ,dependsOn:[MenuRepository]);
}*/

class MenuInterface extends StatefulWidget {
  const MenuInterface({super.key});

  @override
  State<MenuInterface> createState() => _MenuInterfaceState();
}

class _MenuInterfaceState extends State<MenuInterface> {
  final MenuStore menuStore= GetIt.I.get<MenuStore>();

  @override
  void initState() {
    super.initState();
    menuStore.getMenuList();

  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          body:TabBarWidget()
        ),
      ),
    );
  }
}
