import 'package:flutter/material.dart';
import 'package:flutter_lesson/main_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextStyle'),
        ),
        body: Center(
            child: Text(
          'Ini adalah text',
          style: TextStyle(
              fontSize: 30,
              decoration: TextDecoration.overline,
              decorationColor: Colors.red,
              decorationThickness: 5,
              decorationStyle: TextDecorationStyle.wavy),
        )),
      ),
    );
  }
}
