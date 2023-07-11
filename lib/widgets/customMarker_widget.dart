import 'package:fancy_containers/fancy_containers.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  final String name;

  const MarkerWidget({
    super.key,
    required this.name,
  });


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){

        },
        child: SizedBox(

          height: 300,
          width: 350,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 180,
                ),
              ),
              FancyContainer(
                width: 200,
                height: 60,
                onTap: () {

                },
                color1: const Color.fromARGB(255, 255, 255, 255), //Colors.lightGreenAccent,
                color2: const Color.fromARGB(255, 255, 255, 255),//Colors.lightBlue,
                title:"     $name ",
                titleStyle: const TextStyle(
                    fontSize: 32, // Adjust the font size as per your requirements
                    color: Colors.black,fontWeight: FontWeight.bold

                ),
              ),

              const Positioned(
                left: 37,
                bottom: 105,
                child: Icon(
                  Icons.restaurant_menu,
                  color: Colors.black,
                  size: 40,
                ),)
            ],
          ),

        ),
      );
  }
}