import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'search_location_screen.dart';
import 'weather_detail.dart';
import 'weather_overview.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({ Key? key }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  var changeTabScreen = [WeatherDetailScreen(),SearchLocationScreen(),WeatherOverviewScreen()];

  var _page=0; //shows current page number


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Colors.red,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.beenhere_rounded, size: 30),
        ],

       onTap: (index) {
            setState(() {
              _page = index;
            });
          },
       ),

      body: changeTabScreen[_page],
    );
  }
}
