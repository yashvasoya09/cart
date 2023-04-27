import 'package:cart/home/provider/home%20provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class itemScreen extends StatefulWidget {
  const itemScreen({Key? key}) : super(key: key);

  @override
  State<itemScreen> createState() => _itemScreenState();
}

class _itemScreenState extends State<itemScreen> {
  provider? providerF;
  provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<provider>(context, listen: false);
    providerT = Provider.of<provider>(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined, color: Colors.black),
        title: Text("Product",
            style: GoogleFonts.holtwoodOneSc(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            color: Colors.blue,
            child: Image.asset(
              "${providerF!.productList[index].photo}",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${providerF!.productList[index].name}",
                    style: GoogleFonts.ptSerif(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    )),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 15),
                    Text("(4.5)",
                        style: GoogleFonts.ptSerif(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Product Tagline",
                    style: GoogleFonts.ptSerif(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("₹${providerF!.productList[index].price}",
                    style: GoogleFonts.ptSerif(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              providerF!.cartList.add(providerF!.productList[index]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.fixed,
                    content: Text(
                      "${providerT!.productList[index].name} IS ADDED GO TO CART AND VIEW",
                      style: TextStyle(fontSize: 15, color: Colors.indigo),
                    )),
              );
            },
            child: Text(
              "🛒 Add To Cart",
              style: GoogleFonts.ptSerif(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
          ),
        ],
      ),
    ));
  }
}
