import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/location.dart';
import 'package:provider/provider.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>Location(),)
      ],
          child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          // accentColor: Colors.black,
          // primaryColor: Colors.black,
          // canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed'),
          )
        ),
      home: TabsScreen(),
  
       
       
      ),
    );
  }
}

