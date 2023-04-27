import 'package:cart/home/provider/home%20provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  provider? providerF;
  provider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<provider>(context, listen: false);
    providerT = Provider.of<provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cart", style: GoogleFonts.holtwoodOneSc()),
        ),
        body: Stack(children: [
          ListView.builder(
            itemCount: providerF!.cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, 'itemScreen2',arguments: index),
                  child: Container(
                      height: 135,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  "${providerF!.cartList[index].photo}"),
                              radius: 50,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${providerF!.cartList[index].name}",
                                    style: GoogleFonts.ptSerif(
                                        color: Colors.indigoAccent,
                                        fontSize: 14)),
                                Text("${providerF!.cartList[index].price}",
                                    style: GoogleFonts.ptSerif(
                                        color: Colors.indigoAccent,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  providerF!.delete(index);
                                },
                                icon: Icon(Icons.delete)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                                Text("1", style: GoogleFonts.ptSerif()),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 570, 0, 0),
            child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy Now"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo, elevation: 30),
                      )
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
