import 'package:dars_44_home/controllers/products_controller.dart';
import 'package:dars_44_home/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  Product product;
  EditProduct({super.key,required this.product});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final formKey = GlobalKey<FormState>();
  final productTitle = TextEditingController();
  final price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Edit"),
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
                    hintText: "${widget.product.title}",
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
                    hintText: '${widget.product.price}',
                  label: Text("Product narxi")
                ),
              ),

              SizedBox(height: 50,),

              Consumer<ProductsController>(builder: (context,controller,child){
                return TextButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    controller.editProduct(Product(id: widget.product.id, title: productTitle.text, color: widget.product.color, price: double.parse(price.text)));
                    Navigator.pop(context);
                  }

                  setState(() {

                  });
                }, child: Text("Productni saqlash"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
