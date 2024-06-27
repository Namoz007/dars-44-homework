import 'dart:math';

import 'package:dars_44_home/models/product.dart';
import 'package:flutter/material.dart';

class ProductsController extends ChangeNotifier{
  final List<Product> _list = [
    Product(
      id: '1',
      title: "iPhone",
      color: Colors.teal,
      price: 340.5,
    ),
    Product(
      id: '2',
      title: "Macbook",
      color: Colors.grey,
      price: 1340.5,
    ),
    Product(
      id: '3',
      title: "AirPods",
      color: Colors.blue,
      price: 140.5,
    ),
  ];
  List<Product> get list {
    return [..._list];
  }

  void removeProduct(Product product) {
    _list.removeWhere((element) => element.title == product.title);
    notifyListeners();
  }

  void addProduct(Product product){
    _list.add(product);
    notifyListeners();
  }

  String getId(){
    String Id = '';
    while(true){
      bool isFind = false;
      int id = Random().nextInt(1000);
      for(int i = 0;i < _list.length;i++)
        if(_list.contains(id.toString()))
          isFind = true;

      if(!isFind) {
        Id = id.toString();
        break;
      }
    }
    return Id;
  }

  void editProduct(Product product){
    for(int i = 0;i < _list.length;i++)
      if(product.id == _list[i].id){
        _list[i].title = product.title;
        _list[i].price = product.price;
      }

    notifyListeners();
  }
}
