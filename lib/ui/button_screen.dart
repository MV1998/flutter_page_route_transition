import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpageroutetransition/ui/sentry_example.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                'Access',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple,
              splashColor: Colors.amber,
              shape: BeveledRectangleBorder(
                  side: BorderSide(
                      color: Colors.black12, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
            ),
            RaisedButton(
              color: Colors.deepPurple,
              onPressed: () {},
              child: Text(
                'Access',
                style: TextStyle(color: Colors.white),
              ),
              splashColor: Colors.amber,
              shape: BeveledRectangleBorder(
                  side: BorderSide(
                      color: Colors.black12, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
              splashColor: Colors.amber,
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.security),
              onPressed: () {},
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Text('Flat Button'),
              ),
              splashColor: Colors.amber,
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              customBorder: BeveledRectangleBorder(
                  side: BorderSide(
                      color: Colors.black12, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
            ),
            GestureDetector(
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('GestureDetector'),
                ));
              },
              child: Icon(
                Icons.security,
                size: 40,
              ),
            ),
            CupertinoButton(
              child: Text('Apple'),
              onPressed: () {},
            ),
            SentryExample()
          ],
        ),
      ),
    );
  }
}
