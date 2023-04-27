import 'package:cart/home/Model/cart%20model.dart';
import 'package:flutter/cupertino.dart';

class provider extends ChangeNotifier
{
  List<cartModel> productList = [
    cartModel(name: "shoes1",photo: "assets/images/e1.jpeg",price: 1000,),
    cartModel(name: "shoes2",photo: "assets/images/e2.jpeg",price: 1200,),
    cartModel(name: "shoes3",photo: "assets/images/e3.jpeg",price: 1400,),
    cartModel(name: "shoes4",photo: "assets/images/e4.jpeg",price: 1100,),
    cartModel(name: "shoes5",photo: "assets/images/e5.jpeg",price: 1500,),
    cartModel(name: "shoes6",photo: "assets/images/e6.jpeg",price: 1150,),
    cartModel(name: "shoes7",photo: "assets/images/e7.jpeg",price: 1200,),
    cartModel(name: "shoes8",photo: "assets/images/e8.jpeg",price: 1900,),
  ];
  List<cartModel> cartList = [];

  void delete(int index)
  {
    cartList.removeAt(index);
    notifyListeners();
  }
}