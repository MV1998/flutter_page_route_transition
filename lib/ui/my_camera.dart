import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MyCamera extends StatefulWidget {

  final CameraDescription camera;

  MyCamera({@required this.camera});

  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {

  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final path = join((await getExternalStorageDirectories(type: StorageDirectory.dcim))[0].path,'${DateTime.now()}.png');
            await _cameraController.takePicture(path);
            Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
              return DisplayPictureScreen(imagePath: path,);
            }));
            printImage();
          }catch (e){
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: Text('My Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_cameraController);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}


class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

printImage() async{
  final directory = Directory((await getExternalStorageDirectories(type: StorageDirectory.dcim))[0].path);
  final listOfFiles = directory.listSync();
  print('${listOfFiles.length}');
}