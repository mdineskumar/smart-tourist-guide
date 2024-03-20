import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// class PlaceView extends StatelessWidget {

//   final _placeData;

//   PlaceView(context, this._placeData);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_placeData.name),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 3,
//             // child: Text(_placeData.image),
//             child: Image(image: NetworkImage(_placeData.image)),
//           ),
//           Expanded(flex: 3, child: Text(_placeData.description)),

//         ],
//       ),
//     );
//   }
// }

// class PlaceView extends StatefulWidget {
//   final _placeData;

//   PlaceView(context, this._placeData);
//   @override
//   _PlaceViewState createState() => _PlaceViewState();
// }

class PlaceView extends StatelessWidget {
  final _placeData;

  PlaceView(context, this._placeData);

  launchMap() async {
    var mapSchema =
        'https://www.google.com/maps/search/?api=1&query=${_placeData.location.latitude},${_placeData.location.longitude}';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._placeData.name),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                padding: EdgeInsets.all(9),
                color: Colors.white,
                child: Image(image: NetworkImage(this._placeData.image)),
              ),
            ),
          ),

//========== the first button ============

          Row(
            children: <Widget>[
              //========size button=============
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(9),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: launchMap,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Get Directions"),
                  ),
                ),
              ),
            ],
          ),

          Divider(),

          new ListTile(
            title: new Text("Place details"),
            subtitle: new Text('\n' + this._placeData.description),
          ),

          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Open Hours\t\t\t\t\t\t\t\t:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("${this._placeData.open_hrs}"),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Attraction Type\t\t:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(this._placeData.place_type),
              )
              //     REMAINDER TO CREATE PRODUCT BRAND
            ],
          ),
        ],
      ),
    );
  }
}
