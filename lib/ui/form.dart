import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  FocusNode _focusNode;
  FocusNode _passwordNode;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _passwordNode = FocusNode();
    _textEditingController.addListener(() {
      print('editing ${_textEditingController.text}');
    });
  }

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
                controller: _textEditingController,
                focusNode: _focusNode,
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
                    _focusNode.requestFocus();
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
                focusNode: _passwordNode,
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    _passwordNode.requestFocus();
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
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                      content: Text('Processing data $_email and $_password'),
//                    ));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            title: Text('Information'),
                            titleTextStyle: GoogleFonts.abel(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold)),
                            backgroundColor: Colors.deepPurple[100],
                            shape: BeveledRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black12,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                            content: Text(
                              '$_email and $_password',
                              style: GoogleFonts.abel(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold)),
                            ),
                          );
                        });
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

  @override
  void dispose() {
    _focusNode.dispose();
    _passwordNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
}
