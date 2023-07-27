import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_assignment/widgets/tab_widget.dart';
import '../Stores/menu_store.dart';
import 'listview_widget.dart';
import 'navbar_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final MenuStore menuStore = GetIt.I.get<MenuStore>();
    return Scaffold(
      drawer: const NavBarWidget(),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.black,
        title: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: const Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Food Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Material(
              color: Colors.black,
              child: Container(
                height: 55,
                //color: const Color.fromARGB(255, 40, 40, 40),
                color: Colors.transparent,
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 10),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54),
                  tabs: const [
                    TabWidget(
                      type: 'Appetizers',
                    ),
                    TabWidget(
                      type: 'Main',
                    ),
                    TabWidget(
                      type: 'Desserts',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: ListViewWidget(
                      type: 'appetizer',
                    ),
                  ),
                  Center(
                    child: ListViewWidget(
                      type: 'main',
                    ),
                  ),
                  Center(
                    child: ListViewWidget(
                      type: 'dessert',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
