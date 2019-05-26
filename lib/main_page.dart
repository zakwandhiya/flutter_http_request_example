import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'album_model.dart';
import 'custom_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Album> albums = new List<Album>();
  
  void fetchPost() {
    http.get('https://rallycoding.herokuapp.com/api/music_albums').then((onValue){
      parseToAlbum(onValue);
    });
  }

  void parseToAlbum(http.Response onValue){
    List<Album> albumsTmp = new List<Album>();
    for(dynamic item in json.decode(onValue.body)){

      Album album = new Album(
        artist: item["artist"],
        title: item["title"],
        imageUrl: item["image"],
      );

      albumsTmp.add(album);
    }

    setState(() {
      albums = albumsTmp; 
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchPost();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: albums.length == 0? 
        Center(
          child: CircularProgressIndicator(),
        ):
        ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, position) {
            return CustomCard(album: this.albums[position]);
          },
        ),
      ),
    );
  }
}
