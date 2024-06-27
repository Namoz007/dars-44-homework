import 'package:dars_44_home/models/order.dart';
import 'package:flutter/foundation.dart';

class OrderController extends ChangeNotifier{
  List<Order> _orders = [];


  List<Order> getOrders(){
    return [..._orders];
  }

  void addOrder(Order order){
    _orders.add(order);

    notifyListeners();
  }



}