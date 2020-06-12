import 'package:flutter/material.dart';
import 'package:flutterpageroutetransition/ui/sqflite_presentation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/login.dart';
import '../routes/update_ui_based_on_orientation_screen.dart';
import '../ui/first_page.dart';

class AppDrawer extends StatelessWidget {
  final TickerProvider tickerProvider;

  const AppDrawer({Key key, @required this.widget, this.tickerProvider})
      : super(key: key);

  final FirstPage widget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar_second.png'),
            ),
            accountName: Text(
              'Mohit Varma',
              style: GoogleFonts.pavanam(
                  textStyle: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
            accountEmail: Text(
              'mv501049@gmail.com',
              style:
                  GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                // 10% of the width, so there are ten blinds.
                colors: [const Color(0xFFFFFFEE), const Color(0xFF999999)],
                // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          MessageListTile(
            scaffoldState: widget.globalKey,
            tickerProvider: this.tickerProvider,
          ),
          Divider(
            color: Colors.black,
            thickness: .2,
          ),
          AboutListTile(
            applicationIcon: Icon(Icons.apps),
            aboutBoxChildren: <Widget>[
              Icon(Icons.email),
              Icon(Icons.email),
              Icon(Icons.email)
            ],
            applicationName: 'Application',
            applicationVersion: '1.0',
            icon: Icon(Icons.person),
            child: Text('Profile'),
          ),
          Divider(
            color: Colors.black,
            thickness: .2,
          ),
          SettingsListTile(
            tickerProvider: tickerProvider,
            scaffoldState: widget.globalKey,
          ),
          Divider(
            color: Colors.black,
            thickness: .2,
          ),
          StackListTile(),
          SqfLiteListTile(),
        ],
      ),
    );
  }
}

class SqfLiteListTile extends StatelessWidget {
  const SqfLiteListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.message),
      title: Text(
        'SqfLite Presentation',
        style: GoogleFonts.lato(),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SqfLitePresentation();
        }));
      },
    );
  }
}

class StackListTile extends StatelessWidget {
  const StackListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.message),
      title: Text(
        'Stack Performance',
        style: GoogleFonts.lato(),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      },
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {Key key, @required this.tickerProvider, this.scaffoldState})
      : super(key: key);

  final TickerProvider tickerProvider;
  final GlobalKey<ScaffoldState> scaffoldState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.message),
      title: Text(
        'Update the UI based on orientation',
        style: GoogleFonts.lato(),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return UpdateUIBasedOnOrientationScreen();
        }));
      },
    );
  }
}

class MessageListTile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  final TickerProvider tickerProvider;

  const MessageListTile({Key key, this.scaffoldState, this.tickerProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.message),
      title: Text('Message'),
      onTap: () {
        print('message');
        Scaffold.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          animation: CurvedAnimation(
              parent: AnimationController(
                  duration: const Duration(seconds: 3), vsync: tickerProvider),
              curve: Curves.easeInOutSine),
          action: SnackBarAction(
            textColor: Colors.grey[200],
            label: 'Undo',
            onPressed: () {
              print('undo done');
            },
          ),
          content: Text('Power Full Snackbar'),
        ));
        scaffoldState.currentState.isDrawerOpen
            ? Navigator.pop(context)
            : scaffoldState.currentState.openDrawer();
      },
    );
  }
}
