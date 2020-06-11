import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingAppBarScreen extends StatefulWidget {
  @override
  _FloatingAppBarScreenState createState() => _FloatingAppBarScreenState();
}

class _FloatingAppBarScreenState extends State<FloatingAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Float App Bar',
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Floating app bar'),
              floating: true,
              backgroundColor: Colors.amber,
              expandedHeight: 200,
              flexibleSpace: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://picsum.photos/250?image=9'),
                  ),
                  Container(
                    color: Colors.black54,
                  )
                ],
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('$index'),),
                childCount: 100
              ),
            )
          ],
        ),
      ),
    );
  }
}
