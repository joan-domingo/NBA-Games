import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nba_games/camera/CameraWidget.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Camera'),
      ),
      body: CameraWidget(),
    );
  }
}