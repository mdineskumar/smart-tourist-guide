import 'package:flutter/material.dart';
import './place_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final _placeData;

  PlaceTile(_, this._placeData);

  launchMap() async {
    var mapSchema = 'https://www.google.com/maps/search/?api=1&query=${_placeData.location.latitude},${_placeData.location.longitude}';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.location_on),
              onPressed: launchMap,
            ),
            title: Text(_placeData.name),
            subtitle: _placeData.description.length > 20
                ? Text(_placeData.description.substring(0, 20) + ' ...')
                : Text(_placeData.description),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('More Info'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PlaceView(context, _placeData)));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
