import 'package:cart/home/provider/home%20provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  provider? providerF;
  provider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<provider>(context,listen: false);
    providerT = Provider.of<provider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
            title: Text(
              "Our Products",
              style: GoogleFonts.holtwoodOneSc(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              (IconButton(
                onPressed: () {
                    Navigator.pushNamed(context, 'cartScreen');
                },
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              ))
            ]),
        backgroundColor: Colors.black26,
        body: GridView.builder(physics: BouncingScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: providerF?.productList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'itemScreen',arguments: index);
                },
                child: Container(
                  height: 400,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Center(
                          child: CircleAvatar(radius: 40,backgroundImage: AssetImage("${providerF!.productList[index].photo}")),
                        ),
                        Text("${providerF!.productList[index].name}",
                            style: GoogleFonts.ptSerif(
                              fontSize: 16,
                              color: Colors.indigo,
                            )),
                        Text("₹${providerF!.productList[index].price}",
                            style: GoogleFonts.ptSerif(
                              fontSize: 12,
                              color: Colors.indigoAccent,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
