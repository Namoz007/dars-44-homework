
import 'package:dars_44_home/models/cart.dart';

class Order{
  DateTime date;
  Cart products;
  double price;

  Order({required this.date,required this.products,required this.price});
}