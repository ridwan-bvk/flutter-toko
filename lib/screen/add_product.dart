import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  //variabel untuk menagkap data dari form
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
          child: Column(
        children: [
          //ini membuat inputan data,label =placeholder
          TextFormField(
            //nangkep data nya
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nama Produk'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Product name";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(labelText: 'Price'),
          ),
          TextFormField(
            controller: _imageUrlController,
            decoration: InputDecoration(labelText: 'Image_URL'),
          ),
          //jarak ke button
          SizedBox(
            height: 20,
          ),
          //button
          ElevatedButton(
              onPressed: () {
                //ngedebug data di output terminal
                // print(_nameController.text);
              },
              child: Text('simpan'))
        ],
      )),
    );
  }
}
