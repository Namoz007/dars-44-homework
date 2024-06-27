import 'package:dars_44_home/controllers/products_controller.dart';
import 'package:dars_44_home/models/product.dart';
import 'package:dars_44_home/views/screens/add_product.dart';
import 'package:dars_44_home/views/screens/cart_screen.dart';
import 'package:dars_44_home/views/screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersProducts()));
          }, icon: Icon(Icons.reorder)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
          }, icon: Icon(Icons.add)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Consumer<ProductsController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (ctx, index) {
              Product product = controller.list[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
