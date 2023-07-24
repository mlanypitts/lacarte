import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:readmore/readmore.dart';

import '../Stores/menu_store.dart';


class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key, required this.type});

  final String type;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    final MenuStore menuStore = GetIt.I.get<MenuStore>();
    return Observer(builder: (BuildContext context) {
      return
      ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:
              menuStore.foodItems == null ? 0 : menuStore.foodItems.length,
          itemBuilder: (context, index) {
            if (menuStore.foodItems[index].category.toString() == widget.type) {
              return Container(
                //width: (MediaQuery.of(context).size.width)/2,

                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.black,
                    border: Border.all(color: Colors.transparent, width: 2)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(children: [
                  //--container for image
                  Container(
                    width: (MediaQuery.of(context).size.width - 40) / 2,
                     height: 200,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/${menuStore.foodItems[index].image}'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    //onClick: menuStore.addToCart(foodItems[index]);
                  ),
                  //--container for details
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: (MediaQuery.of(context).size.width - 40) / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${menuStore.foodItems[index].name}", style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      20, /*decoration: TextDecoration.underline*/
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),

                          ReadMoreText(
                            "Ingredients: ${menuStore.foodItems[index].ingredients}",
                            trimLines: 2,
                            colorClickableText: Colors.white,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: ' Show less',
                            moreStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10,),
                         /* Observer(builder: (_) {
                            return*/
                              Row(
                                children: [
                                  Text(
                                    "Rs.${menuStore.foodItems[index].price}",
                                    style: const TextStyle(
                                        color: Colors.yellowAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight
                                            .bold /*decoration: TextDecoration.underline*/
                                    ),

                                  ),
                                  const SizedBox(width: 8,),

                                  (menuStore.foodItems[index].selected!=true) ?
                                  GestureDetector(
                                    onTap: () {
                                      menuStore.foodItems[index].selected=true;
                                      menuStore.addToCart(
                                          menuStore.foodItems[index]);
                                      print("added to cart");
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                                25),
                                            border: Border.all(
                                                color: Colors.white
                                            )
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Add to Order',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )

                                    ),
                                  )
                                      : GestureDetector(
                                    onTap: () {
                                      menuStore.foodItems[index].selected=false;
                                      menuStore.removeFromCart(
                                          menuStore.foodItems[index]);
                                      print("remove cart");
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                                25),
                                            border: Border.all(
                                                color: Colors.green
                                            )
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Remove Order',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )

                                    ),
                                  )
                                ],
                              )//;
                          //})
                        ],
                      ),
                    ),
                  ),
                ]),
              );
            } else {
              return Container(
                color: Colors.blue,
              );
            }
          });
    });

  }
}
