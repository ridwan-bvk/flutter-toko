import 'package:flutter/material.dart';

//materi statfullWidget (tampilan berubah sesuai dg statenya)
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  void tekanTombol() {
    // number = number + 1; //ini hanya tampil difungsi tapi tampilannya belum
    setState(() {
      //ini untuk mengubah tampilan sesuai state
      number = number + 1;
    });
  } //methode yang dipanggil

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'StatefullWidget',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '(tampilan berubah sesuai state)',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(number.toString(),
                  style: TextStyle(
                      fontSize: 20 +
                          number
                              .toDouble()) //ni akan menambah ukuran karena fs tipenya double
                  ),
              RaisedButton(
                  //ini button
                  child: Text('tambah bilangan'),
                  onPressed: tekanTombol)
            ],
          ),
        ),
      ),
    );
  }
}
