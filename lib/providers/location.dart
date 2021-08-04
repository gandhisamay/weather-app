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

  List<double> get minTemps5days{
    return [..._minTemps];
  }

  List<double> get maxTemps5days{
    return [..._maxTemps];
  }

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
    // var year = date.substring(0, 4);
    // var month = date.substring(5, 7);
    // var day = date.substring(8, 10);

    final url = Uri.parse('https://www.metaweather.com/api/location/$_woeid/');
    final response = await http.get(url);
    // {consolidated_weather:
    //[{id: 5295501353156608, weather_state_name: Heavy Rain, weather_state_abbr: hr,
    // wind_direction_compass: WSW, created: 2021-08-02T10:03:01.963265Z, applicable_date:
    // 2021-08-02, min_temp: 26.865, max_temp: 29.915, the_temp: 28.685,
    //wind_speed: 12.47597132310772, wind_direction: 243.1658529488439,
    // air_pressure: 1007.0, humidity: 80, visibility: 9.216488208860255, predictability: 77},
    // {id: 5311543827759104, weather_state_name: Heavy Rain, weather_state_abbr: hr,
    // wind_direction_compass: WSW, created: 2021-08-02T10:03:04.957071Z, applicable_date: 2021-08-03, min_temp: 26.810000000000002, max_temp: 29.255, the_temp: 28.369999999999997, wind_speed: 12.241166946059016, wind_direction: 244.169629973454, air_pressure: 1008.0, humidity: 82, visibility: 8.50004722421061, predictability: 77}, {id: 6113358588674048, weather_state_name: Heavy Rain, weather_state_abbr: hr, wind_direction_compass: WSW, created: 2021-08-02T10:03:07.966176Z, applicable_date: 2021-08-04, min_temp: 26.83, max_temp: 29.355,
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
    notifyListeners();
  }

  Future<void> combineAllData() async {
    await getLocation();
    await getWoeid();
    await getWeatherData();
    notifyListeners();
  }
}
