import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadAndWriteFiles extends StatefulWidget {
  @override
  _ReadAndWriteFilesState createState() => _ReadAndWriteFilesState();
}

class _ReadAndWriteFilesState extends State<ReadAndWriteFiles> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode;
  String _contents;
  String _buttonText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _buttonText = 'Save Data to File';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read and Write Files'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: _focusNode,
                  onTap: () {
                    print('on tap');
                  },
                  onChanged: (value) {
                    print('on change $value');
                    _contents = value;
                    writeCounter(_contents);
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
                      return 'Enter some data';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Data',
                      border: UnderlineInputBorder(),
                      fillColor: Colors.grey[300],
                      filled: true,
                      focusColor: Colors.amber,
                      helperText: 'e. g. My name is Mohit Varma',
                      prefixIcon: Icon(Icons.update)),
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        Future<String> contents = readCounter();
                        contents.then((value) =>
                        {_buttonText = value, _focusNode.unfocus()});
                      }
                    });
                  },
                  child: Text(
                    '$_buttonText',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> localPath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> localFile() async {
  final path = await localPath();
  print('$path');
  return File('$path/counter.txt');
}

Future<void> writeCounter(String data) async {
  final file = await localFile();
  file.writeAsStringSync(data);
}

Future<String> readCounter() async {
  try {
    final file = await localFile();
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return 'some thing wrong';
  }
}
