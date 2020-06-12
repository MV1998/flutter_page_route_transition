import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/dog.dart';

class SqfLitePresentation extends StatefulWidget {
  @override
  _SqfLitePresentationState createState() => _SqfLitePresentationState();
}

class _SqfLitePresentationState extends State<SqfLitePresentation> {
  Future<List<Dog>> future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = dogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: RaisedButton(
              color: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  putData();
                  future = dogs();
                });
              },
              child: Text(
                'Access',
                style: TextStyle(color: Colors.white),
              ),
              splashColor: Colors.amber,
              shape: BeveledRectangleBorder(
                  side: BorderSide(
                      color: Colors.black12,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Dog>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          updateDog(Dog(
                              id: snapshot.data[index].id,
                              name: 'simple',
                              age: snapshot.data[index].age));
                          setState(() {
                            future = dogs();
                          });
                        },
                        onLongPress: () {
                          deleteDog(snapshot.data[index].id);
                          setState(() {
                            future = dogs();
                          });
                        },
                        title: Text(
                            '${snapshot.data[index].toString()} and ${snapshot.data.length}'),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
