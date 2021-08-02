import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

class WeatherOverviewScreen extends StatelessWidget {
  // const WeatherOverviewScreen({ Key? key }) : super(key: key);

  final textStyle1 = TextStyle(color: Colors.white, fontSize: 19);
  final textStyle2 = TextStyle(color: Colors.white, fontSize: 16);

 loc.LocationData currentLocation;
 double latitude;
 double longitude ;

  Future<void> getLocation() async {
    var location =new loc.Location();

    //check if service enabled 
    var serviceEnabled =await location.serviceEnabled();

    if( ! serviceEnabled) {
      serviceEnabled= await location.requestService();    
    }

    if(!serviceEnabled) {
      return ;
    }
    
    //ask for permission  
     var _permissionGranted = await location.hasPermission();

     if(_permissionGranted == loc.PermissionStatus.denied) {
       _permissionGranted =await location.requestPermission();
     }

     if(_permissionGranted == loc.PermissionStatus.denied) {
       return ;
     }
     
     var currentLocation = await location.getLocation();

     print(currentLocation); //LocationData<lat: 19.2322681, long: 72.8434758>

     latitude= currentLocation.latitude;
     longitude=currentLocation.longitude;   
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
            Text('San Fransisco,California ,USA', style: textStyle1),
            SizedBox(height: 25),
            CircleAvatar(
              radius: 80,
             
              child: ClipRRect(
                
              ),
            ),
            SizedBox(height: 25),
            Chip(
              backgroundColor: Colors.purple,
              label: Text(
                'Moonlight',
                style: textStyle1,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '20°C',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.reorder_rounded,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      '5 km/h',
                      style: textStyle2,
                    )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      '7%',
                      style: textStyle2,
                    )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      '0.533 mBar',
                      style: textStyle2,
                    )
                  ],
                )),
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Text(
                'Temperature',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () async  {
                  
                  getLocation();
                },
              ),
            ),
            ListTile(
              leading: Text(
                'Wind Speed',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            ListTile(
              leading: Text(
                'Source',
                style: textStyle1,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
