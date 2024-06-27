import 'package:dars_44_home/controllers/order_controller.dart';
import 'package:dars_44_home/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersProducts extends StatefulWidget {
  const OrdersProducts({super.key});

  @override
  State<OrdersProducts> createState() => _OrdersProductsState();
}

class _OrdersProductsState extends State<OrdersProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Orders"),
      ),
      body: Consumer<OrderController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.getOrders().length,
            itemBuilder: (context, index) {
              var order = controller.getOrders()[index];
              List<String> keys = order.products.products.keys.toList();
              List<Product> orderProducts = keys.map((key) => order.products.products[key]['product'] as Product).toList();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product name',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Product amount',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      ...orderProducts.map((product) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.title),
                            Text('Price: \$${product.price}'),
                          ],
                        ),
                      )).toList(),
                      SizedBox(height: 30),
                      Text(
                        'Total price: \$${order.products.totalPrice}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}