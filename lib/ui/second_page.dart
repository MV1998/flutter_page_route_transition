import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String title;

  SecondPage({this.title});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _height = 50;
  double _width = 50;
  bool visible = false;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8);
  Duration duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {

            visible = !visible;

            final random = Random.secure();

            // Generate a random width and height.
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadiusGeometry =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: AnimatedContainer(
            height: _height,
            width: _width,
//          child: MaterialButton(
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//            color: Colors.deepPurple,
//            onLongPress: () {
//              debugPrint('long pressed');
//            },
//            splashColor: Colors.white,
//            child: Text(
//              'First Page',
//              style:
//              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//            ),
//          ),
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadiusGeometry,
            ),
            duration: duration,
            curve: Curves.ease,
          ),
        ),
      ),
    );
  }
}
