import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpageroutetransition/ui/all_files_read.dart';
import '../ui/my_camera.dart';

import '../routes/app_grid_list.dart';
import '../routes/floating_app_bar_screen.dart';
import '../routes/image_from_internet.dart';
import '../routes/swipe_to_dismiss.dart';
import '../ui/bloc_pattern_implemented_screen.dart';
import '../ui/button_screen.dart';
import '../ui/draggable_card.dart';
import '../ui/drawer.dart';
import '../ui/fetch_data_from_internet.dart';
import '../ui/form.dart';
import '../ui/my_hero.dart';
import '../ui/my_video_player.dart';
import '../ui/read_and_writes_files.dart';
import '../ui/second_page.dart';

class FirstPage extends StatefulWidget {
  final String title;
  final globalKey = GlobalKey<ScaffoldState>();

  FirstPage({this.title});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
//  startTime() async {
//    var _duration = new Duration(seconds: 5);
//     new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    Navigator.of(context).pushReplacementNamed('Second Page');
//  }

  @override
  void initState() {
    super.initState();
//    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        key: widget.globalKey,
        drawer: AppDrawer(
          widget: widget,
          tickerProvider: this,
        ),
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 'SwipeToDismiss':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SwipeToDismiss();
                    }));
                    break;
                  case 'InternetImages':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return InternetImageScreen();
                    }));
                    break;
                  case 'GridList':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AppGridList();
                    }));
                    break;
                  case 'FloatingAppBar':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FloatingAppBarScreen();
                    }));
                    break;
                  case 'ReadAndWriteFiles':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ReadAndWriteFiles();
                    }));
                    break;
                  case 'VideoPlayer':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MyVideoPlayer();
                    }));
                    break;
                  case 'MyCamera':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FutureBuilder<CameraDescription>(
                        future: appCamera(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData){
                            return MyCamera(camera: snapshot.data);
                          }
                          return CircularProgressIndicator();
                        },
                      );
                    }));
                    break;
                  case 'AllFiles':
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AllFilesDisplay();
                    }));
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'SwipeToDismiss',
                  child: Text('SwipeToDismiss'),
                ),
                const PopupMenuItem<String>(
                  value: 'InternetImages',
                  child: Text('Image From Internet'),
                ),
                const PopupMenuItem<String>(
                  value: 'GridList',
                  child: Text('GridList'),
                ),
                const PopupMenuItem<String>(
                  value: 'FloatingAppBar',
                  child: Text('FloatingAppBar'),
                ),
                const PopupMenuItem<String>(
                  value: 'ReadAndWriteFiles',
                  child: Text('Read And Write Files'),
                ),
                const PopupMenuItem<String>(
                  value: 'VideoPlayer',
                  child: Text('Video Player'),
                ),
                const PopupMenuItem<String>(
                  value: 'MyCamera',
                  child: Text('My Camera'),
                ),
                const PopupMenuItem<String>(
                  value: 'AllFiles',
                  child: Text('Display All Images'),
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
              ),
              Tab(
                text: 'MyHero',
              ),
              Tab(
                text: 'Internet Data',
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
            CustomButton(),
            MyHero(),
            MyInternetData()
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

Future<CameraDescription> appCamera() async {
  final camerasList = await availableCameras();
  final firstCamera = camerasList.first;
  return firstCamera;
}
