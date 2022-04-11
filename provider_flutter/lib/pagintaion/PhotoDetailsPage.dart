import 'package:flutter/material.dart';

class PhotoDetails extends StatelessWidget {
  PhotoDetails({
    Key? key,
    required this.tag,
    required this.url,
  }) : super(key: key);
  String tag;
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: tag,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: AppBar(
            title: Text("Transparent AppBar"),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
                tooltip: 'Share',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
