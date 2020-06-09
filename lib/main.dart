import 'package:flutter/material.dart';
import 'package:flutterpageroutetransition/utilities/web_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/first_page.dart';

void main() {

  print('${WebServices.baseURL}/${WebServices.networkURL}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme
        ),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(title: 'First Page'),
    );
  }
}

