import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AllFilesDisplay extends StatefulWidget {
  @override
  _AllFilesDisplayState createState() => _AllFilesDisplayState();
}

class _AllFilesDisplayState extends State<AllFilesDisplay> {

  Future<List<Uint8List>> future;

  String directory;
  List file = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = printImage();
    _listofFiles();
  }

  void _listofFiles() async {
    directory = (await getExternalStorageDirectories(type: StorageDirectory.dcim))[0].path;
    setState(() {
      file = Directory("$directory").listSync();  //use your folder name insted of resume.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Images'),
      ),
      body: FutureBuilder<List<Uint8List>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData){
           return GridView.count(
             crossAxisCount: 2,
             children: List.generate(snapshot.data.length, (index) => Padding(padding : EdgeInsets.all(5),child: Image.memory(snapshot.data[index]))),
           );
          }
          return Center(
            child: ListView.builder(
              itemCount: file.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(file[index].toString());
              }),);
        },
      ),
    );
  }
}


Future<List<Uint8List>>  printImage() async {
  final listFile = <Uint8List>[];
  try{
    final directory = Directory('${(await getExternalStorageDirectories(type: StorageDirectory.dcim))[0].path}/');
    final listOfFiles = directory.listSync(recursive: true, followLinks: false);
    for (var entity in listOfFiles){
      if (entity is File){
        listFile.add(await getUint8List(entity));
        print('${await getUint8List(entity)}');
      }else {
        print('contents is not file type');
      }
    }
    print('directory length : ${listFile.length}');
    return listFile;
  }catch (e){
    print(e);
  }
  return listFile;
}

Future<Uint8List>  getUint8List(File file) async{
  return await file.readAsBytes();
}

//class MyGridView extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//        crossAxisCount: 2,
//      children: List.generate(2, (index) => Image.memory(snapshot.data[index])),
//    );
//  }
//}
