import 'package:flutter/material.dart';

class FavouriteCity {
  int temp;
  String city;
  String country;
  int humidity;
  int windSpeed;

  FavouriteCity({
    @required this.temp,
    @required this.city,
    @required this.country,
    @required this.humidity,
    @required this.windSpeed,
  });
}

class FavouriteCityProvider with ChangeNotifier {
  List<FavouriteCity> _favourites = [];

  List<FavouriteCity> get favourites {
    return [..._favourites];
  }

  void addNewFavourite(
    int temp,
    String city,
    String country,
    int humidity,
    int windSpeed,
  ) {
    if (_favourites.contains(FavouriteCity(
        temp: temp,
        city: city,
        country: country,
        humidity: humidity,
        windSpeed: windSpeed))) {
      return;
    } else {
      _favourites.add(
        FavouriteCity(
          temp: temp,
          city: city,
          country: country,
          humidity: humidity,
          windSpeed: windSpeed,
        ),
      );
    }
    notifyListeners();
  }
}
