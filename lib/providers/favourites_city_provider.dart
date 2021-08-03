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
  List<FavouriteCity> _favourites = [
    FavouriteCity(
      temp: 22,
      city: "Austria",
      country: "USA",
      humidity: 17,
      windSpeed: 7,
    ),
    FavouriteCity(
      temp: 22,
      city: "Mumbai",
      country: "India",
      humidity: 28,
      windSpeed: 10,
    ),
    FavouriteCity(
      temp: 22,
      city: "Surat",
      country: "India",
      humidity: 12,
      windSpeed: 5,
    ),
    FavouriteCity(
      temp: 22,
      city: "Florida",
      country: "USA",
      humidity: 23,
      windSpeed: 2,
    ),
    FavouriteCity(
      temp: 22,
      city: "Austria",
      country: "USA",
      humidity: 17,
      windSpeed: 7,
    ),
    FavouriteCity(
      temp: 22,
      city: "Mumbai",
      country: "India",
      humidity: 28,
      windSpeed: 10,
    ),
    FavouriteCity(
      temp: 22,
      city: "Surat",
      country: "India",
      humidity: 12,
      windSpeed: 5,
    ),
    FavouriteCity(
      temp: 22,
      city: "Florida",
      country: "USA",
      humidity: 23,
      windSpeed: 2,
    ),
    FavouriteCity(
      temp: 22,
      city: "Austria",
      country: "USA",
      humidity: 17,
      windSpeed: 7,
    ),
    FavouriteCity(
      temp: 22,
      city: "Mumbai",
      country: "India",
      humidity: 28,
      windSpeed: 10,
    ),
    FavouriteCity(
      temp: 22,
      city: "Surat",
      country: "India",
      humidity: 12,
      windSpeed: 5,
    ),
    FavouriteCity(
      temp: 22,
      city: "Florida",
      country: "USA",
      humidity: 23,
      windSpeed: 2,
    ),
    FavouriteCity(
      temp: 22,
      city: "Austria",
      country: "USA",
      humidity: 17,
      windSpeed: 7,
    ),
    FavouriteCity(
      temp: 22,
      city: "Mumbai",
      country: "India",
      humidity: 28,
      windSpeed: 10,
    ),
    FavouriteCity(
      temp: 22,
      city: "Surat",
      country: "India",
      humidity: 12,
      windSpeed: 5,
    ),
    FavouriteCity(
      temp: 22,
      city: "Florida",
      country: "USA",
      humidity: 23,
      windSpeed: 2,
    ),
  ];

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
