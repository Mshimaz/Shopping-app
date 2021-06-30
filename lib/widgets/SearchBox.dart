import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String val) onSubmitted;
  final Function() onSearchTap;
  final String firstValue;
  SearchBox({this.onSubmitted,this.onSearchTap,this.firstValue});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 57,
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            margin: EdgeInsets.only(left: 30),),
            InkWell(
              child: Container(
                height: 45,
                width: 48,
                margin: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 10),
                decoration: BoxDecoration(
                    color: Color(0xff6495ED),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset("assets/logo/Filter.png"),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 80, top: 44,right: 85),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search items...",
            border: InputBorder.none,
          ),
          onSubmitted: onSubmitted,
          onTap: onSearchTap,
          controller: TextEditingController()..text = firstValue,
        ),
      )
    ]);
  }
}
