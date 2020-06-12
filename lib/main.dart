import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/first_page.dart';
import 'utilities/web_services.dart';

void main() {
  print('${WebServices.baseURL}/${WebServices.networkURL}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Navigator.defaultRouteName,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Navigator.defaultRouteName: (BuildContext context) => FirstPage(
          title: 'First Page',
        ),
      },
    );
  }
}
