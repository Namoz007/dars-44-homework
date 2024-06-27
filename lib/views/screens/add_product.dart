import 'dart:math';
import 'package:dars_44_home/controllers/products_controller.dart';
import 'package:dars_44_home/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  final productTitle = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty)
                    return 'Product nomi bosh bolmasligi kerak';

                  return null;
                },
                controller: productTitle,
                decoration: InputDecoration(
                  hintText: "Product title",
                  border: OutlineInputBorder()
                ),
              ),

              SizedBox(height: 30,),

              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty)
                    return 'Product narxi bosh bolmasligi kerak';

                  try{
                    double price = double.parse(value);
                    return null;
                  }catch(e){
                    return 'Product narxini raqamlar bilan kiriting';
                  }
                },
                controller: price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product narxi'
                ),
              ),

              SizedBox(height: 50,),

              Consumer<ProductsController>(builder: (context,controller,child){
                return TextButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    controller.addProduct(Product(id: controller.getId(), title: productTitle.text, color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)), price: double.parse(price.text)));
                    Navigator.pop(context);
                  }

                  setState(() {

                  });
                }, child: Text("Product qoshish"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
