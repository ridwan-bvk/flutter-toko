import 'package:flutter/material.dart';
import 'package:flutter_lesson/main_container.dart';

// import 'dart:async';
//anonymous metode jika metode itua hanya dipanggil satu kali saja
//tanpa dipanggil ditempat lain,contoh disini metode tomblditekan
//dan bisa lebih diringkas,penulisanna (){..data..}
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //ini tidak usah dipake langsung saja
  String message = 'ini adalah text';
  void tombolDitekan() {
    setState(() {
      message = 'tombol sudah ditekan';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnonymousMethod'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text('ini adalah text'),
              Text(message),
              RaisedButton(
                child: Text(
                  'tekan saya',
                  style: TextStyle(color: Colors.red),
                ),
                // onPressed: tombolDitekan
                onPressed: () {
                  setState(() {
                    message = 'sudah ditekan';
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
