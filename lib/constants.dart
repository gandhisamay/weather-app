import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double ktabSize = 50;

const TextStyle kTempStyle = TextStyle(
  color: Colors.white,
  fontSize: 50,
  fontFamily: 'Raleway',
);
const TextStyle kCountryStyle = TextStyle(
  color: Colors.grey,
  fontSize: 20,
  fontFamily: 'Raleway',
);

const TextStyle kCityStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontFamily: 'Raleway',
);

bool isFirstTime = true;
bool isLoading = true;

final Widget snowSvg =
    SvgPicture.asset('assets/images/Snow.svg', semanticsLabel: 'Snow');
final Widget clearSvg =
    SvgPicture.asset('assets/images/Clear.svg', semanticsLabel: 'Snow');
final Widget hailSvg =
    SvgPicture.asset('assets/images/Hail.svg', semanticsLabel: 'Snow');
final Widget heavycloudSvg =
    SvgPicture.asset('assets/images/Heavy Cloud.svg', semanticsLabel: 'Snow');
final Widget heavyrainSvg =
    SvgPicture.asset('assets/images/Heavy Rain.svg', semanticsLabel: 'Snow');
final Widget lightcloudsvg =
    SvgPicture.asset('assets/images/Light Cloud.svg', semanticsLabel: 'Snow');
final Widget lightrainSvg =
    SvgPicture.asset('assets/images/Light Rain.svg', semanticsLabel: 'Snow');
final Widget showersSvg =
    SvgPicture.asset('assets/images/Showers.svg', semanticsLabel: 'Snow');

final Widget sleetSvg =
    SvgPicture.asset('assets/images/Sleet.svg', semanticsLabel: 'Snow');

final Widget thunderstormSvg =
    SvgPicture.asset('assets/images/Thunderstorm.svg', semanticsLabel: 'Snow');

Map<String, Widget> weatherVsSVG = {
  "Snow": snowSvg,
  "Clear": clearSvg,
  "Hail": hailSvg,
  "Heavy Cloud": heavycloudSvg,
  "Heavy Rain": heavyrainSvg,
  "Light Rain": lightrainSvg,
  "Light Cloud": lightcloudsvg,
  "Sleet": sleetSvg,
  "Showers": showersSvg,
  "Thunderstorm": thunderstormSvg,
};
