import 'package:flutter/material.dart';


class LoadingScreenOverview extends StatelessWidget {
  // const LoadingScreenOverview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
            Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
        ),
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
                'Fetching Data...',
                style: TextStyle(
                  color: Theme.of(context).accentTextTheme.title.color,
                  fontSize: 50,
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Flexible(
              flex: deviceSize.width > 600 ? 2 : 1,
              child: Center(
                  child: CircularProgressIndicator(
                value: 20,
              ))),
        ],
      ),
    );
  }
}
// Center(child: CircularProgressIndicator())
