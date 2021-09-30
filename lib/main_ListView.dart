import 'package:flutter/material.dart';

//kelemahan column itu terbatas jika kebawah,
//kalau list view itu akan ada scroll jika sampai batas bawah/melebih layar
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = []; //ini deklrasi lis
  int counter = 1;
//buat contruktur,sebelum memakai button
  // _MyAppState() {
  //   for (int i = 0; i < 20; i++)
  //     widgets.add(
  //         Text('Data Ke - ' + i.toString(), style: TextStyle(fontSize: 35)));
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('LisView Widget')),
        body: ListView(
          // Column( //pake column akan ada erris bottom

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                    child: Text('Tambah Data'),
                    onPressed: () {
                      setState(() {
                        widgets.add(Text(
                          'Data ke -' + counter.toString(),
                          style: TextStyle(fontSize: 20),
                        ));
                        counter++;
                      });
                    }),
                ElevatedButton(
                    child: Text('Kurangai Data'),
                    onPressed: () {
                      setState(() {
                        widgets.removeLast();
                        counter--;
                      });
                    }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, //untuk rata kiri
              children: widgets,
            )
          ],
        ),
      ),
    );
  }
}
