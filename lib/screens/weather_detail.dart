//1st screen in the ui image
import 'package:flutter/material.dart';

class WeatherDetailScreen extends StatelessWidget {
  // const WeatherDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF17242D),
        // gradient: LinearGradient(
        //   colors: [Colors.black, Color.fromRGBO(8, 27, 36, 1)],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: Center(
        child: Text('page 1'),
      ),
    );
  }
}
