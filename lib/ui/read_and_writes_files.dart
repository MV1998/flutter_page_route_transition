import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                        saveToDisk();
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
                Center(
                  child: FutureBuilder<Uint8List>(
                    future: getImageData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.memory(snapshot.data);
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                )
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

Future<String> localDCIMPath() async {
  final directories =
  await getExternalStorageDirectories(type: StorageDirectory.dcim);
  final directory = directories[0];
  return directory.path;
}

Future<File> localFile() async {
  final path = await localPath();
  final dcimPath = await localDCIMPath();
  print('$dcimPath');
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

Future<File> internetImageFile() async {
  final path = await localDCIMPath();
  return File('$path/image.jpg');
}

Future<Uint8List> getImageData() async {
  final response = await http.get(
      'https://i.picsum.photos/id/134/200/300.jpg?grayscale&hmac=G7XHhkeiL7Ml4-KVEbBQQj_-Y0Bd_p8RN0K50fLUILE');
  return response.bodyBytes;
}

Future<void> saveToDisk() async {
  final file = await internetImageFile();
  final data = await getImageData();
  file.writeAsBytesSync(data);
}
