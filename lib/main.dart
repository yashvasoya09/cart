import 'package:cart/home/provider/home%20provider.dart';
import 'package:cart/home/view/cart%20screen.dart';
import 'package:cart/home/view/home%20screen.dart';
import 'package:cart/home/view/item%20screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/view/item screen2.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => homeScreen(),
          'itemScreen':(context) => itemScreen(),
          'itemScreen2':(context) => itemScreen2(),
          'cartScreen':(context) => cartScreen(),
        },
      ),
    ),
  );
}
