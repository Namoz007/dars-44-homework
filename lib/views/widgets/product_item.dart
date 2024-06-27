import 'package:dars_44_home/controllers/cart_controller.dart';
import 'package:dars_44_home/controllers/products_controller.dart';
import 'package:dars_44_home/models/product.dart';
import 'package:dars_44_home/views/screens/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: product.color,
      ),
      title: Text(
        product.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text("\$${product.price}"),
      trailing: SizedBox(
        width: 150, // Adjust the width as per your requirement
        child: Row(
          children: [
            Consumer<CartController>(
              builder: (context, controller, child) {
                return controller.isInCart(product.id)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.removeFromCart(product.id);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                          Text(
                            controller.getProductAmount(product.id).toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.addToCart(product);
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Consumer<ProductsController>(
                            builder: (context, controller, child) {
                              return IconButton(
                                  onPressed: () {
                                    controller.removeProduct(product);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ));
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              controller.addToCart(product);
                            },
                            icon: const Icon(Icons.shopping_cart_outlined),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProduct(product: product,)));
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
