import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String title;


  SecondPage({this.title});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.deepPurple,
          onLongPress: () {
            debugPrint('long pressed');
          },
          splashColor: Colors.white,
          child: Text('First Page', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
