import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  @override
  _SwipeToDismissState createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {

  final items = List<String>.generate(20, (index) => 'items $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('SwipeToDismiss'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            onDismissed: (direction) {
              print(direction);
              setState(() {
                items.removeAt(index);
              });
            },
            background: Container(color: Colors.red,),
            secondaryBackground: Container(color: Colors.amber,),
            key: Key(item),
            child: ListTile(
              title: Text('$index'),
            ),
          );
        },
      ),
    );
  }
}
