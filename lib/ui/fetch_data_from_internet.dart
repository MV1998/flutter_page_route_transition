import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyInternetData extends StatefulWidget {
  @override
  _MyInternetDataState createState() => _MyInternetDataState();
}

class _MyInternetDataState extends State<MyInternetData> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Album>>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${snapshot.data[index].toString()}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  final String body;

  Album({this.userId, this.id, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  @override
  String toString() {
    return 'id : $id, userId : $userId, title : $title, body : $body';
  }
}

Future<List<Album>> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts/',
      headers: {HttpHeaders.authorizationHeader: ''});
  var albumList = <Album>[];
  if (response.statusCode == 200) {
    var list = json.decode(response.body);
    for (var map in list) {
      albumList.add(Album.fromJson(map));
    }
    return albumList;
  } else {
    throw Exception('Failed to load album');
  }
}
