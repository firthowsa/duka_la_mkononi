import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget{
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: <Widget>[
          Text('Deliver features faster'),
          Text('Craft beautiful UIs'),

        ],
      ),
    );




}

}