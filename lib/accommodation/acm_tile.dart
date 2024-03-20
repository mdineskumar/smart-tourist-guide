import 'package:flutter/material.dart';
import './acm_view.dart';
class AcmTile extends StatelessWidget {
  final _placeData;

  AcmTile(_,this._placeData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.local_hotel),
            title: Text(_placeData.name),
            subtitle: _placeData.address.length > 20 ?Text(_placeData.address.substring(0,20)+' ...'):Text(_placeData.address),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('More Info'),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>AcmView(context, _placeData)
                    ));
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
