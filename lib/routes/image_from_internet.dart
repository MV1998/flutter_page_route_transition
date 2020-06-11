import 'package:flutter/material.dart';

class InternetImageScreen extends StatefulWidget {
  @override
  _InternetImageScreenState createState() => _InternetImageScreenState();
}

class _InternetImageScreenState extends State<InternetImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InternetImage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Image.network('https://picsum.photos/250?image=9'),
              FadeInImage(
                placeholder: AssetImage('assets/images/avatar_second.png'),
                image: NetworkImage('https://github.com/iampawan/awesomeDialogs/blob/master/doc/gif.gif?raw=true'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
