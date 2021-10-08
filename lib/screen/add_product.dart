import 'package:flutter/material.dart';
import 'package:toko_online/screen/homepage.dart';

class AddProduct extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  AddProduct({Key? key}) : super(key: key);

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));
      return;
    } else {
      return null;
    }
    // _formKey.currentState.save();
  }

  //variabel untuk menagkap data dari form
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
          key: _formKey,
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
              ElevatedButton(onPressed: () => _submit(), child: Text('simpan'))
            ],
          )),
    );
  }
}
