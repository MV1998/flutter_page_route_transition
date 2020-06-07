import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateUIBasedOnOrientationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("UpdateUIBasedOnOrientation", style:
        GoogleFonts.lato(textStyle: TextStyle(
          fontSize: 18.0
        )),),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: List.generate(100, (index) => Text('Hello MOhit')),);
        },
      ),
    );
  }
}
