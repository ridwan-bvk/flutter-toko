import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map product; //membuat parameter lemparan

  ProductDetail({required this.product}); //contstractor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product"),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(product['image_url']),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product['price'], style: TextStyle(fontSize: 22)),
                Row(
                  children: [Icon(Icons.edit), Icon(Icons.delete)],
                )
              ],
            ),
          ),
          Text(product['description'])
        ],
      ),
    );
  }
}
