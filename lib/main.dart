import 'package:dars_44_home/controllers/order_controller.dart';
import 'package:dars_44_home/controllers/products_controller.dart';
import 'package:dars_44_home/utils/styles.dart';
import 'package:dars_44_home/views/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:dars_44_home/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
        ChangeNotifierProvider(create: (ctx){
          return ProductsController();
        }),

        ChangeNotifierProvider(
          create: (ctx){
            return OrderController();
          },
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: ProductsScreen(),
        );
      },
    );
  }
}
