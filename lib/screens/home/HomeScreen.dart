import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home/SearchScreen.dart';
import 'package:shopping_app/widgets/DressIconButton.dart';
import 'package:shopping_app/widgets/SearchBox.dart';
import 'package:shopping_app/widgets/productCard.dart';

import 'ProductScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(children: [
      Container(
        margin: EdgeInsets.only(
          top: 35,
          left: 20,
        ),
        child: Text(
          "Explore",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        child: Text(
          "best Outfits for you",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
      ),
      SearchBox(
        onSubmitted: (val) {},
        onSearchTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ));
        },
      ),
      Container(
          height: 80,
          margin: EdgeInsets.only(top: 30),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DressIconButton(
                dressImage: "assets/logo/dress.png",
                dressText: "Dress",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          firstValue: "dress",
                        ),
                      ));
                },
              ),
              DressIconButton(
                dressImage: "assets/logo/shirt.png",
                dressText: "Shirts",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          firstValue: "shirt",
                        ),
                      ));
                },
              ),
              DressIconButton(
                dressImage: "assets/logo/pants.png",
                dressText: "Pants",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          firstValue: "pant",
                        ),
                      ));
                },
              ),
              DressIconButton(
                dressImage: "assets/logo/tshirt.png",
                dressText: "T-shirts",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          firstValue: "tshirt",
                        ),
                      ));
                },
              ),
              DressIconButton(
                dressImage: "assets/logo/sneakers 1.png",
                dressText: "Shoes",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          firstValue: "shoe",
                        ),
                      ));
                },
              )
            ],
          )),
      Container(
        margin: EdgeInsets.only(left: 25, top: 50, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Arrival",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Text(
              "See All",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            )
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      FutureBuilder<QuerySnapshot>(
        future: _productsRef.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data.docs.map((document) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(
                              productId: document.id,
                            ),
                          ));
                    },
                    child: ProductCard(
                      name: "${document.data()['name']}",
                      image: "${document.data()['image']}",
                      price: "Rs ${document.data()['price']}",
                      onTapFavouriteicon: (){},
                    ),
                  );
                }).toList(),
              ),
            );
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    ]));
  }
}
