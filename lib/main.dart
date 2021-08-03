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
          primaryColor: Colors.red, //Color(0xFF17242D),
          accentColor: Color(0xFF17242D),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                // bodyText2: TextStyle(
                //   color: Colors.white,
                // ),
                // bodyText1: TextStyle(
                //   color: Colors.white,
                // ),
                headline6:
                    TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
              ),
          scaffoldBackgroundColor: Color(0xFF17242D),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red,
          )),
      home: TabsScreen(),
      ),
    );
  }
}
