import 'package:flutter/material.dart';

class BuildWeatherContainer extends StatelessWidget {
  const BuildWeatherContainer({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Icon(
          icon,
          color: Colors.blueGrey,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
          ),
        )
      ],
    ));
  }
}