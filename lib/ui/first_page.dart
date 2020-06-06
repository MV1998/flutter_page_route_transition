import 'package:flutter/material.dart';

import '../ui/second_page.dart';

class FirstPage extends StatefulWidget {
  final String title;

  FirstPage({this.title});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute(_animationController));
          },
          color: Colors.deepPurple,
          onLongPress: () {
            debugPrint('long pressed');
          },
          splashColor: Colors.white,
          child: Text(
            'Second Page',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Route _createRoute(AnimationController animationController) {
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
