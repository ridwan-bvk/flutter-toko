import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('container'),
        ),
        body: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue), //tambahan
            // color: Colors.blue, //seharusnya
            margin: EdgeInsets.fromLTRB(10, 15, 20, 25), //jarak keluar widget
            padding: EdgeInsets.only(
                bottom: 30, top: 30, right: 5, left: 5), //jarak kedalam
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter, //mulai warna
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.white,
                        Colors.blue,
                        Colors.white //tambahan
                      ])),
              // margin: EdgeInsets.all(15),
              // color: Colors.amber,
            )),
      ),
    );
  }
}
