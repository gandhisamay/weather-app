//1st screen in the ui image
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/row_card_scroll.dart';

class WeatherDetailScreen extends StatelessWidget {
  // const WeatherDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF17242D),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      // height: deviceHeight*0.4,
                      margin: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text('San Fransico', style: kCityStyle),
                          Text('18°',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceHeight * 0.1)),
                          Chip(
                            backgroundColor: Colors.purple,
                            label: Text(
                              'Cloudy',
                            ),
                            elevation: 5,
                          ),
                        ],
                      )),
                  Card(
                    elevation: 5,
                    child: Text('Image here '),
                  ),
                ],
              ),
              SizedBox(height: deviceHeight * 0.007),
              Card(
                elevation: 6,
                color: Color(0xFF17242D),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWeatherContainer(icon: Icons.reorder_rounded, text: '8 km/h'),
                      _buildWeatherContainer(icon: Icons.pin_drop_rounded, text: '54 %'),
                      _buildWeatherContainer(icon: Icons.alarm, text: '1098 bar'),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: deviceHeight * 0.06),
              Container(
                child: Text('Chart here ..'),
                height: deviceHeight * 0.1,
                color: Colors.white,
                width: double.infinity,
              ),
              SizedBox(height: deviceHeight * 0.004),
              Text(
                'Today',
                style: TextStyle(color: Colors.blueGrey),
                textAlign: TextAlign.left,
              ),
              Container(
                height: deviceHeight * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                        WeatherCard(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: deviceHeight * 0.3,
                child: ListView(
                  children: [
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                    _buildListTile(text: 'Monday', maxTemp: '19 °C', minTemp: '15'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildListTile extends StatelessWidget {
  const _buildListTile({
    Key key,
    @required this.text,
    @required this.maxTemp,
    @required this.minTemp,
  }) : super(key: key);

  final String text;
  final String maxTemp;
  final String minTemp;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color(0xFF17242D),
      child: ListTile(
        leading:
            Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
        //   title:  Container(
        //           child: Text('icon here '),
        //           height: 10,
        //           color: Colors.white,
        // ),
        trailing:
            // Container(
            // width: 10,
            // margin: EdgeInsets.only(right:20),
            // child: Row(

            //   children: [
            Text(
          maxTemp,
          style: kCityStyle,
        ),
        // SizedBox(width:5),
        // Text(minTemp,style: kCountryStyle,),
        // ],
      ),
      // ),
      // ),
    );
  }
}

class _buildWeatherContainer extends StatelessWidget {
  const _buildWeatherContainer({
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
        Text(
          text,
          style: TextStyle(color: Colors.blueAccent, fontSize: 15),

          // style: null,
        )
      ],
    ));
  }
}
