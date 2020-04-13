import 'package:flutter/material.dart';

import 'src/circle_navigation_bar/circle_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleNavigationBar(
              circleIcons: [
                CustomIcon(icon: Icon(Icons.call), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.message), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.accessible), onPressed: () {}),
              ],
              navBarIcons: [
                CustomIcon(icon: Icon(Icons.home), onPressed: () {}),
                CustomIcon(
                    icon: Icon(Icons.supervised_user_circle), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.settings), onPressed: () {}),
                CustomIcon(icon: Icon(Icons.exit_to_app), onPressed: () {}),
              ],
              margin: 16.0,
              borderRadius: BorderRadius.circular(16),
            ),
          )
        ],
      ),
    );
  }
}