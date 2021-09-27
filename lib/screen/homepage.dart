import 'dart:convert';
// import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_online/screen/product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  final String url = 'http://127.0.0.1:8000/api/products';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body)); //debug data diterminal
    return json.decode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Ridwan-store',
            textAlign: TextAlign.center,
          ),
        ),
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, AsyncSnapshot Snapshot) {
              if (Snapshot.hasData) {
                return ListView.builder(
                    itemCount: Snapshot.data.length,
                    itemBuilder: (contex, index) {
                      return Container(
                        height: 180,
                        child: Card(
                          elevation: 5, //baris bayangan
                          child: Row(
                            children: [
                              //dirow itu karena banya maka children
                              GestureDetector(
                                //ini event gestur di widget
                                onTap: () {
                                  //cara menghubungkan ke halaman lain
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => ProductDetail(
                                              product: Snapshot.data[index])));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.all(
                                        4), //biar ga mepet,ada jarak
                                    height: 120,
                                    width: 120,
                                    //karena gambar url memakai image.network
                                    child: Image.network(
                                        Snapshot.data[index]['image_url'])),
                              ), //bungkus dg container agar bisa diberi size
                              //kalau kebawah pake kolom,bungkus textnya dengan kolom
                              Expanded(
                                //agar didorong ke depan tengan
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround, //agar ada spasi
                                    children: [
                                      Align(
                                        //biar kekanan text nya
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          Snapshot.data[index]['name'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(Snapshot.data[index]
                                              ['description'])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.edit), //buat icon
                                          Text(Snapshot.data[index]['price']
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ), //buat namanya
                            ],
                          ),
                        ),
                      );
                      // return Text(Snapshot.data[index]['name']);
                    });
                //Text('ok');
              } else {
                return Text('Not ok');
              }
            }));
  }
}

//   final String apiUrl = 'http://127.0.0.1:8000/api/products';

//   Future<List<dynamic>> getProducts() async {
//     var result = await http.get(Uri.parse(apiUrl));
//     return json.decode(result.body)['data'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ridwan-Store'),
//       ),
//       body: Container(
//         child: FutureBuilder<List<dynamic>>(
//             future: getProducts(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ListTile(
//                         leading: CircleAvatar(
//                           radius: 30,
//                           backgroundImage:
//                               NetworkImage(snapshot.data[index]['image_url']),
//                         ),
//                         title: Text(snapshot.data[index]['name']),
//                       );
//                     });
//               } else {
//                 return Text('error');
//               }
//             }),
//       ),
//     );
//   }
// }
