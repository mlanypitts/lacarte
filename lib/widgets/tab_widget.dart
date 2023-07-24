import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String type;
  const TabWidget({
    super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return  Tab(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Colors.white54, width: 1)),
        child:  Align(
            alignment: Alignment.center,
            child: Text(type)),
      ),
    );}}