import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_assignment/widgets/tab_widget.dart';
import '../Stores/menu_store.dart';
import 'listview_widget.dart';

class TabBarWidget extends StatelessWidget {

  const TabBarWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
   // final MenuStore menuStore = GetIt.I.get<MenuStore>();
    return DefaultTabController(
      length: 3,
      child: Column(

        children: [

          Container(height: 100,width: MediaQuery.of(context).size.width, color: Colors.transparent,

            child: Stack(
              children: [
                Positioned(
                   right:300,
                    bottom: 2,
                    child: Image.asset('assets/images/lemon.png',width: 200,height: 200,)),
                Positioned(
                  left: 40,
                    top: 50,
                    child: Image.asset('assets/images/lettuce.png',width: 100,height: 100,)),
                Positioned(
                    left: 35,
                    top: 47,
                    child: Image.asset('assets/images/lettuce.png',width: 150,height: 100,)),
                Positioned(
                  bottom: 20,
                  right: 160,
                    child: Image.asset('assets/images/tomato.png',width: 100,height: 140,)),
                Positioned(
                  top: 10,
                    right: 1,
                    child: Image.asset('assets/images/mint.png',width: 100,height: 100,)),
                const Positioned(
                  top: 0,
                    bottom: 0,
                    left:0,
                    right: 0,

                    child: Center(child: Text("Food Menu",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40,)))),


              ],
            ),
          ),
          const SizedBox(height: 5,),
          Material(
              color: Colors.transparent,
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

                      TabWidget( type: 'Appetizers',),
                      TabWidget( type: 'Main',),
                      TabWidget( type: 'Desserts',),

                    ]),
              )),
           const Expanded(
              child: TabBarView(children: [
                Center(child: ListViewWidget(type: 'appetizer',)),
                Center(child: ListViewWidget(type: 'main',)),
                Center(child: ListViewWidget(type: 'dessert',)),

              ]))
        ],
      ),
    );
  }}