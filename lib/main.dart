import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final List<String> _photos = [
    'assets/images/space-a.jpg',
    'assets/images/space-b.jpg',
    'assets/images/space-c.jpg'
  ];

  void changeIndex() {
    setState(() {
      if (index == 2)
        index = 0;
      else
        index++;
    });
  }

  void _timer() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      changeIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    _timer();
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Image.asset(
            _photos[index],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
