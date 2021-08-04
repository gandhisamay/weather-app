import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreenOverview extends StatelessWidget {
  var spinkit = SpinKitFadingFour(
  color: Colors.white,
  size: 50.0,
);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF17242D),
      ),
      height: deviceSize.height,
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
            

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Text(
                'fetching your location data...',
                style: TextStyle(
                  color: Theme.of(context).accentTextTheme.title.color,
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Flexible(
              flex: deviceSize.width > 600 ? 2 : 1,
              child: Center(
                  child: spinkit)),
        ],
      ),
    );
  }
}
// Center(child: CircularProgressIndicator())
