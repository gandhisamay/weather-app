import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/detail_screen_provider.dart';
import 'package:flutter_complete_guide/providers/location.dart';
import 'package:flutter_complete_guide/screens/weather_detail.dart';
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
        ChangeNotifierProvider(
          create: (ctx) => Location(),
        ),
        ChangeNotifierProvider(
          create: (ctx)=>Detail(),)

      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
            primaryColor: Colors.red, //Color(0xFF17242D),
            accentColor: Color(0xFF17242D),
            fontFamily: 'Raleway',
            scaffoldBackgroundColor: Color(0xFF17242D),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.red,
            )),
        home: TabsScreen(),

        routes: {
          WeatherDetailScreen.routeName : (ctx) => WeatherDetailScreen(),
        },

      ),
    );
  }
}
