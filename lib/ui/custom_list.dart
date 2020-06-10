import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
          );
        });
  }
}
