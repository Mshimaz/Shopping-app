import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/SearchBox.dart';
import 'package:shopping_app/widgets/productCard.dart';

import 'ProductScreen.dart';

class SearchScreen extends StatefulWidget {
  final String firstValue;
  SearchScreen({this.firstValue = ""});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchString = "";
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_searchString.isEmpty)
            Center(
              child: Container(
                child: Text(
                  "Search Results",
                ),
              ),
            )
          else
            FutureBuilder<QuerySnapshot>(
              future: _productsRef.orderBy('search_string').startAt(
                  [_searchString]).endAt(["$_searchString\uf8ff"]).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return Container(
                    margin: EdgeInsets.only(top: 90),
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
                            price: "\$${document.data()['price']}",
                            onTapFavouriteicon: () {},
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
          SearchBox(
            firstValue: widget.firstValue,
            onSubmitted: (value) {
              setState(() {
                _searchString = widget.firstValue;
                _searchString = value.toLowerCase();
              });
            },
          ),
        ],
      ),
    );
  }
}
