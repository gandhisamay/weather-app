import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Location with ChangeNotifier {
  int _temperature;
  int _windSpeed;
  double _airPressure;
  double _latitude;
  double _longitude;
  int _woeid;
  String _location;
  int _humidity;
  List<double> _minTemps = [];
  List<double> _maxTemps = [];
  // var inputLocationController = TextEditingController();
  dynamic weatherCardData = [];

  String get location {
    return _location;
  }

  String get temperature {
    return _temperature.toString();
  }

  String get windSpeed {
    return _windSpeed.toString();
  }

  String get airPressure {
    return _airPressure.toString();
  }

  String get humidity {
    return _humidity.toString();
  }

  int get dayNumber {
    var dayNum = DateTime.now().weekday;
    return dayNum;
  }

  List<double> get minTemps5days {
    return [..._minTemps];
  }

  List<double> get maxTemps5days {
    return [..._maxTemps];
  }

  // List<List<String>> get weatherCardDataMain {
  //   return [...weatherCardData];
  // }

  Future<void> getLocation() async {
    var location = new loc.Location();
    //check if service enabled
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (!serviceEnabled) {
      return;
    }
    //ask for permission
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted == loc.PermissionStatus.denied) {
      return;
    }

    var currentLocation = await location.getLocation();

    print(currentLocation); //LocationData<lat: 19.2322681, long: 72.8434758>

    _latitude = currentLocation.latitude;
    _longitude = currentLocation.longitude;
    print(_latitude);
    print(_longitude);

    notifyListeners();
  }

  Future<void> getWoeid() async {
    final url = Uri.parse(
        'https://www.metaweather.com/api/location/search/?lattlong=$_latitude,$_longitude');
    //https://www.metaweather.com/api/location/search/?lattlong=19.2322482,72.8434354
    final response = await http.get(url);
    // print(json.decode(response.body));
    //{distance: 17673, title: Mumbai,
    //location_type: City, woeid: 12586539, latt_long: 19.076191,72.875877},
    _location = json.decode(response.body)[0]['title'];
    _woeid = json.decode(response.body)[0]['woeid'];
    print(_woeid);
    print(_location);
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    final url = Uri.parse('https://www.metaweather.com/api/location/$_woeid/');
    final response = await http.get(url);
    

    var consolidatedWeather =
        json.decode(response.body)['consolidated_weather'];
    var wData = consolidatedWeather[0];

    double temp = wData['the_temp'];
    _temperature = temp.round();

    double wSpeed = wData['wind_speed'];
    _windSpeed = wSpeed.round();

    _airPressure = wData['air_pressure'];

    _humidity = wData['humidity'];

    for (int i = 0; i <= 4; i++) {
      _minTemps.add(consolidatedWeather[i]['min_temp']);
      _maxTemps.add(consolidatedWeather[i]['max_temp']);
    }

    final date = DateTime.now().toString();//2021-08-05 17:13:50.658
    String year = date.substring(0, 4); 
    String month = date.substring(5, 7);
    String day = date.substring(8, 10);
    print('$year ----$month ----$day');
    final urlDaily = Uri.parse(
        "https://www.metaweather.com/api/location/$_woeid/$year/$month/$day/");
        //put a / at the end of api
        //https://www.metaweather.com/api/location/44418/2013/4/27/
    final responseDaily = await http.get(urlDaily);
    final resDaily = json.decode(responseDaily.body);
    // print(resDaily);

    for (int i = 0; i < 3; i++) {
      if (int.parse(resDaily[0]["created"].substring(11, 13)) > 12) {
        //also add the abbrevations to get the images url
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          // resDaily[i]["weather_state_abbr"],
          '${resDaily[i]["the_temp"]} °C',
          '${(int.parse(resDaily[i]["created"].substring(11, 13)) - 12)} PM'
        ]);
      } else if (int.parse(resDaily[0]["created"].substring(11, 13)) == 12) {
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          // resDaily[i]["weather_state_abbr"],
          '${resDaily[i]["the_temp"]} °C',
          '${(int.parse(resDaily[i]["created"].substring(11, 13)))} PM'
        ]);
      } else {
        weatherCardData.add([
          resDaily[i]["weather_state_name"],
          // resDaily[i]["weather_state_abbr"],
          '${resDaily[i]["the_temp"]} °C',
          '${int.parse(resDaily[i]["created"].substring(11, 13))} AM',
        ]);
          print(resDaily[i]["created"].substring(11, 13));
      }
    }

    print("!");
    notifyListeners();
  }

  Future<void> combineAllData() async {
    await getLocation();
    await getWoeid();
    await getWeatherData();
    notifyListeners();
  }

  // Future<void> getLocationByQuery(query) async {
  //   print('New function.......');
  //   final date = DateTime.now().toString();
  //   String year = date.substring(0, 4);
  //   String month = date.substring(5, 7);
  //   String day = date.substring(8, 10);
  //   final urlQuery = Uri.parse(
  //       "https://www.metaweather.com/api/location/search/?query=$query");
  //   final responseQuery = await http.get(urlQuery);
  //   final resQuery = json.decode(responseQuery.body);

  //   // final urlLattLong = Uri.parse(
  //   //     'https://www.metaweather.com/api/location/search/?lattlong=${resQuery[0]["latt_long"]}');
  //   // //https://www.metaweather.com/api/location/search/?lattlong=19.2322482,72.8434354
  //   // final responseLattLong = await http.get(urlLattLong);
  //   // final resLattLong = json.decode(responseLattLong.body);
  //   _location=resQuery[0]['title'];
  //   _woeid = resQuery[0]["woeid"];
  //   print(_woeid);

  //   final urlDaily = Uri.parse(
  //       "https://www.metaweather.com/api/location/$_woeid/$year/$month/$day");
  //   final responseDaily = await http.get(urlDaily);
  //   final resDaily = json.decode(responseDaily.body);
    
  //   //we need to override the values to get the data of the query city
  //   var todayData = resDaily[0];
  //   _humidity= todayData['humidity'];

  //   var wSpeed=todayData['wind_speed'];
  //   _windSpeed =wSpeed.round();

  //   _airPressure= todayData['air_pressure'];
   

  //   var tempData= todayData['the_temp'];
  //   _temperature=tempData.round();

  //    print('$_humidity---$_windSpeed----$_airPressure----$_temperature');
  //   //..

  //   for (int i = 0; i < 3; i++) {
  //     if (int.parse(resDaily[i]["created"].substring(11, 13)) > 12) {
  //       weatherCardData.add([
  //         resDaily[i]["weather_state_name"],
  //         '${resDaily[i]["the_temp"]} °C',
  //         '${(int.parse(resDaily[i]["created"].substring(11, 13)) - 12)} PM'
  //       ]);
  //     } else if (int.parse(resDaily[i]["created"].substring(11, 13)) == 12) {
  //       weatherCardData.add([
  //         resDaily[i]["weather_state_name"],
  //         '${resDaily[i]["the_temp"]} °C',
  //         '${(int.parse(resDaily[i]["created"].substring(11, 13)))} PM'
  //       ]);
  //     } else {
  //       weatherCardData.add([
  //         resDaily[i]["weather_state_name"],
  //         '${resDaily[i]["the_temp"]} °C',
  //         '${(int.parse(resDaily[i]["created"].substring(11, 13)))} AM'
  //       ]);
  //     }
  //   }

  //   notifyListeners();
  // }
}
