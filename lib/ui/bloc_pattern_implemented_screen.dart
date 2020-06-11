import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/custom_list.dart';
import '../ui/form.dart';

class BLoCPattern extends StatefulWidget {
  @override
  _BLoCPatternState createState() => _BLoCPatternState();
}

class _BLoCPatternState extends State<BLoCPattern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MyCustomForm(),
          ),
          Expanded(
            child: CustomListView(),
          )
        ],
      ),
    );
  }
}
