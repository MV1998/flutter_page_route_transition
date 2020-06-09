import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// create a visual Login page on the screen
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamController<String> controller = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Login'),
//        backgroundColor: Colors.amber,
//      ),
      body: Stack(
        alignment: Alignment.center,

        /// Stack for overlapping widget
        children: <Widget>[
          /// Create visual background image as first item in stack
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.srgbToLinearGamma(),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://source.unsplash.com/user/erondu/1600x900'))),
          ),
          //Create
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white30),
          ),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        helperText: 'e. g. Mohit Varma'),
                    onSubmitted: (data) {
                      controller.add(data);
                      Stream stream = controller.stream;
                      stream.listen((event) {
                        print(event);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        helperText: 'e. g. mv501049@gmail.com'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
