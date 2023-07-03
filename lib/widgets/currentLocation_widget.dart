import 'package:flutter/material.dart';

class MarkerWidgetCurrentLocation extends StatelessWidget {


  const MarkerWidgetCurrentLocation({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return
      const SizedBox(
        height: 300,
        width: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(height: 5,),
            Icon(
              Icons.location_on,
              color: Colors.red,
              size: 100,
            )
          ],
        ),

      );
  }
}
