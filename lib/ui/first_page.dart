import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/bloc_pattern_implemented_screen.dart';
import '../ui/button_screen.dart';
import '../ui/draggable_card.dart';
import '../ui/drawer.dart';
import '../ui/form.dart';
import '../ui/second_page.dart';

class FirstPage extends StatefulWidget {
  final String title;
  final globalKey = GlobalKey<ScaffoldState>();

  FirstPage({this.title});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: widget.globalKey,
        drawer: AppDrawer(
          widget: widget,
          tickerProvider: this,
        ),
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'vlaue',
                  child: Text('Working a lot harder'),
                ),
                const PopupMenuItem<String>(
                  value: 'vlaue',
                  child: Text('Being a lot smarter'),
                ),
                const PopupMenuItem<String>(
                  value: 'vlaue',
                  child: Text('Being a self-starter'),
                ),
                const PopupMenuItem<String>(
                  value: 'vlaue',
                  child: Text('Placed in charge of trading charter'),
                ),
              ],
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Draggable',
              ),
              Tab(
                text: 'TextField',
              ),
              Tab(
                text: 'TextFieldWithListView',
              ),
              Tab(
                text: 'Buttons',
              )
            ],
          ),
          title: Text(widget.title),
        ),
        body: TabBarView(
          children: <Widget>[
            DraggableCard(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                color: Colors.deepPurple,
                onLongPress: () {
                  debugPrint('long pressed');
                },
                splashColor: Colors.white,
                child: Text(
                  'Second Page',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MyCustomForm(),
            BLoCPattern(),
            CustomButton()
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        SecondPage(title: 'Second Page'),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.linear;

      double first = 0.0;
      double last = 1.0;
      var doubleTween = Tween(begin: first, end: last);

      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return ScaleTransition(
        scale: doubleTween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
