import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/loading_spinner.dart';
import '../providers/location.dart';
import 'package:provider/provider.dart';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

class WeatherOverviewScreen extends StatefulWidget {
  // const WeatherOverviewScreen({ Key? key }) : super(key: key);

  @override
  _WeatherOverviewScreenState createState() => _WeatherOverviewScreenState();
}

class _WeatherOverviewScreenState extends State<WeatherOverviewScreen> {
  final textStyle1 = TextStyle(color: Colors.white, fontSize: 19);
  final textStyle2 = TextStyle(color: Colors.white, fontSize: 16);
  var _isInit= false ;
  var _isLoading =true;

  @override
  void initState() {
    Provider.of<Location>(context, listen: false).combineAllData().then((_){
       _isInit=true;
    });
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
       _isLoading=false;
    });    
    }  
    _isInit= false;
    super.didChangeDependencies();
  }

  Widget _buildListTile({String text, Function onPressed}) {
    return ListTile(
      
              leading: Text(
                text,
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,                
                  color: Colors.white,
                ),
                onPressed: () {
                  print('Button pressed');
                  onPressed();
                },
              ),
            );
  }

  Widget _buildWeatherContainer(IconData icon, String text) {
    return Container(
                    child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      text,
                      
                      style: textStyle2,
                    )
                  ],
                ));
  }

  @override
  Widget build(BuildContext context) {

    final weatherDataProvider =Provider.of<Location>(context);
    final deviceHeight =MediaQuery.of(context).size.height;
    
    return SafeArea(
      child: Scaffold(
        body: _isLoading? LoadingScreenOverview():Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.location_city,
                  color: Colors.blueGrey,
                ),
                const Text(
                  'Your Location Now ',
                  style: TextStyle(color: Colors.grey),
                )
              ]),
            ),
            // Text(locData.location, style: textStyle1),
            Text(weatherDataProvider.location, style: textStyle1),
            
            SizedBox(height: 25),
            CircleAvatar(
              radius: deviceHeight*0.1,
              child: ClipRRect(), //child should be an image of day/night according to time 
            ),
            SizedBox(height: 25),
            Chip(
              backgroundColor: Colors.purple,
              label: Text(
                //text changes depending on time 
                'Moonlight',
                style: textStyle1,
              ),
            ),
            SizedBox(height: 5),
            Text(
              weatherDataProvider.temperature+'°C',
              style: TextStyle(fontSize: deviceHeight*0.07, color: Colors.white),
            ),
            SizedBox(height: deviceHeight*0.03),
            Container(
              height: deviceHeight*0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 _buildWeatherContainer(Icons.reorder_rounded,weatherDataProvider.windSpeed+' km/h'),
                 _buildWeatherContainer( Icons.pin_drop_rounded,weatherDataProvider.humidity+' %'),
                 _buildWeatherContainer(Icons.alarm,weatherDataProvider.airPressure+' bar'),                              
                ],
              ),
            ),
            SizedBox(height: deviceHeight*0.05),    
                 
             Container(
               height: deviceHeight*0.22,
               child: Column(
                 children: [
                   _buildListTile(text:'Temperature',onPressed:null),
                   _buildListTile(text:'Wind Speed',onPressed:null),
                   _buildListTile(text: 'Source' ,onPressed: null),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
