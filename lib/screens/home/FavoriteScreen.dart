import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home/ProductScreen.dart';
import 'package:shopping_app/services/firebase_services.dart';
import 'package:shopping_app/widgets/productCard.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  bool isFavourite = true;
  Future _removeFromFavourites(String productId) {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Favourites")
        .doc(productId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.usersRef
                .doc(_firebaseServices.getUserId())
                .collection("Favourites")
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return Container(
                  padding: EdgeInsets.only(top: 50),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                  productId: document.id,
                                ),
                              ));
                        },
                        child: FutureBuilder(
                          future: _firebaseServices.productsRef
                              .doc(document.id)
                              .get(),
                          builder: (context, productSnap) {
                            if (productSnap.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("${productSnap.error}"),
                                ),
                              );
                            }

                            if (productSnap.connectionState ==
                                ConnectionState.done) {
                              Map _productMap = productSnap.data.data();

                              return ProductCard(
                                name: "${_productMap['name']}",
                                image: "${_productMap['image']}",
                                price: "Rs \$${_productMap['price']}",
                                isFavorite: true,
                                onTapFavouriteicon: () async {
                                   setState((){
                                     _removeFromFavourites(document.id);
                                  });
                                },
                              );
                            }

                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: Text(
                  "Favorite",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )),
        ],
      ),
    );
  }
}
