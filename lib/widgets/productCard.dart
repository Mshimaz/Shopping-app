import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final bool isFavorite;
  final Function() onTapFavouriteicon;
  ProductCard(
      {this.name,
      this.image,
      this.price,
      this.isFavorite = false,
      this.onTapFavouriteicon,
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 0.5, color: Colors.grey)),
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                width: 140,
                height: 130,
                child: ClipRRect(
                  child: Image.network(image),
                ),
              ),
              isFavorite ?
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: onTapFavouriteicon,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset("assets/logo/favoritesactive.png")
                  ),
                ),
              ):
              SizedBox()
            ],
          ),
          Container(
            child: Column(
              children: [
                Center(
                    child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )),
                Center(
                    child: Text(
                  price,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
