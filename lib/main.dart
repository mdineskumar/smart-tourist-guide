// // // Copyright 2018 The Flutter team. All rights reserved.
// // // Use of this source code is governed by a BSD-style license that can be
// // // found in the LICENSE file.

// // import 'package:english_words/english_words.dart' as prefix0;
// // import 'package:flutter/material.dart';
// // import 'package:english_words/english_words.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // final wordPair = WordPair.random();
// //     return MaterialApp(
// //       title: 'Startup Name Generator',
// //       home: RandomWords(),
// //     );
// //   }
// // }

// // class RandomWords extends StatefulWidget {
// //   @override
// //   RandomWordsState createState() => RandomWordsState();
// // }

// // class RandomWordsState extends State<RandomWords> {
// //   final _suggestions = <WordPair>[];
// //   final _biggerFont = const TextStyle(fontSize: 18.0);
// //   // @override
// //   // Widget build(BuildContext context) {
// //   //   final wordPair = WordPair.random();
// //   //   return Text(wordPair.asPascalCase);
// //   // }
// //   Widget _buildRow(WordPair pair){
// //     return ListTile(
// //       title: Text(
// //         pair.asPascalCase,style: _biggerFont,
// //       ),
// //     );
// //   }

// //   Widget _buildSuggestions() {
// //     return ListView.builder(
// //         padding: const EdgeInsets.all(16.0),
// //         itemBuilder: /*1*/ (context, i) {
// //           if (i.isOdd) return Divider(); /*2*/
// //           final index = i ~/ 2; /*3*/
// //           if (index >= _suggestions.length) {
// //             _suggestions.addAll(prefix0.generateWordPairs().take(10)); /*4*/
// //           }
// //           return _buildRow(_suggestions[index]);
// //         });
// //   }

// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Startup Name generator'),
// //     ),
// //     body: _buildSuggestions(),);
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:myapp/product_manager.dart';


// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         theme: ThemeData(
// //             brightness: Brightness.light,
// //             primarySwatch: Colors.deepOrange,
// //             accentColor: Colors.deepPurple),
// //         home: Scaffold(
// //           appBar: AppBar(
// //             title: Text('EasyList'),
// //           ),
// //           body: ProductManager(),
// //         ));
// //   }
// // }





// // import 'package:flutter/material.dart';
// // import './text_control.dart';
// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         home: Scaffold(
// //       appBar: AppBar(
// //         title: Text('App Title'),
// //       ),
// //       body: Center(
// //           child: TextControl()),
// //     ));
// //   }
// // }






import 'package:flutter/material.dart';
import './home_screen.dart';
import './accommodation_screen.dart';
import './emergency_screen.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/accommodation':(context) => AccommodationScreen(),
        // '/place_view':(context)=> PlaceView(),
        '/emergency':(context)=>EmergencyScreen(),
      },
    );
  }
}



