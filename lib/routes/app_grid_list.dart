import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppGridList extends StatefulWidget {
  @override
  _AppGridListState createState() => _AppGridListState();
}

class _AppGridListState extends State<AppGridList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index)  {
          return Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Image.network('https://picsum.photos/250?image=9'),
              ),
              Positioned(
                top: 148,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.amber,
                  child: Text('Index is $index', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
