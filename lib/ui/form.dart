import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextFormField(
                onTap: () {
                  print('on tap');
                },
                onChanged: (value) {
                  print('on change $value');
                  _email = value;
                },
                onEditingComplete: () {
                  print('on editing complete');
                },
                onFieldSubmitted: (value) {
                  print('on field submitted $value');
                },
                onSaved: (value) {
                  print('on saved $value');
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Email Address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: UnderlineInputBorder(),
                    fillColor: Colors.grey[300],
                    filled: true,
                    focusColor: Colors.amber,
                    helperText: 'e. g. mv501049@gmail.com',
                    prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: UnderlineInputBorder(),
                    fillColor: Colors.grey[300],
                    filled: true,
                    focusColor: Colors.amber,
                    helperText: 'e. g. password123@',
                    prefixIcon: Icon(Icons.security)),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
//              shape: RoundedRectangleBorder(
//                side: BorderSide(
//                  color: Colors.amber,
//                  width: 1,
//                  style: BorderStyle.solid
//                ),
//                borderRadius: BorderRadius.circular(5)
//              ),
                shape: const StadiumBorder(
                  side: BorderSide(
                      color: Colors.black12,
                      width: 1,
                      style: BorderStyle.solid),
                ),
//                shape: BeveledRectangleBorder(
//                    side: BorderSide(
//                        color: Colors.black12,
//                        width: 1,
//                        style: BorderStyle.solid),
//                    borderRadius: BorderRadius.circular(10)),
//              shape: ContinuousRectangleBorder(
//                  side: BorderSide(
//                      color: Colors.amber,
//                      width: 1,
//                      style: BorderStyle.solid
//                  ),
//                  borderRadius: BorderRadius.circular(20)
//              ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Processing data $_email and $_password'),
                    ));
                    FocusScope.of(context).unfocus();
                  }
                },
                color: Colors.grey[400],
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
