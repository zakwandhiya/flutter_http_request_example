import 'package:flutter/material.dart';
import 'album_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.album}); 


  final Album album;

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Image.network( 
    //         album.imageUrl ,
    //         fit: BoxFit.fitWidth,

    //         height: 350,
    //       ),


    //       Text("Title     : " + album.title),
    //       Text("Artist    : " + album.artist),
    //     ],
    //   )
      
      

    // );

    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    final List<Widget> children = <Widget>[
      SizedBox(
        height: 350.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Ink.image(
                image: NetworkImage(album.imageUrl),
                fit: BoxFit.cover,
                child: Container(),
              ),
            ),
            
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  album.artist,
                  style: descriptionStyle.copyWith(color: Colors.black54),
                ),
              ),
              Text(album.title),
            ],
          ),
        ),
      ),
    ];


    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      )
    );
     
  }
}