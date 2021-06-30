import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingNavigationBar extends StatelessWidget {
  final int currentindex;
  final void Function(int index) ontap;
  ShoppingNavigationBar({this.currentindex, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
    border: Border.all(width: 0.5,color: Colors.grey),
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
    topLeft: Radius.circular(30),
    )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 29),
                  height: 12,
                  width: 20,
                  decoration: BoxDecoration(
                      color: currentindex == 0
                          ? Color(0xff6495ED)
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 73),
                  height: 12,
                  width: 20,
                  decoration: BoxDecoration(
                      color: currentindex == 1
                          ? Color(0xff6495ED)
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 70),
                  height: 12,
                  width: 20,
                  decoration: BoxDecoration(
                      color: currentindex == 2
                          ? Color(0xff6495ED)
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 71),
                  height: 12,
                  width: 20,
                  decoration: BoxDecoration(
                      color: currentindex == 3
                          ? Color(0xff6495ED)
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            elevation: 0,
            currentIndex: currentindex,
            backgroundColor: Colors.transparent,
            onTap: ontap,
            selectedFontSize: 0,
            items: [
              BottomNavigationBarItem(
                icon: currentindex == 0
                    ? Image.asset("assets/logo/homeactive.png")
                    : Image.asset("assets/logo/Home.png"),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: currentindex == 1
                    ? Image.asset("assets/logo/buyactive.png")
                    : Image.asset("assets/logo/Buy.png"),
                title: Text("Cart"),
              ),
              BottomNavigationBarItem(
                icon: currentindex == 2
                    ? Image.asset("assets/logo/activewhishlist.png")
                    : Image.asset("assets/logo/Heart.png"),
                title: Text("Wishlist"),
              ),
              BottomNavigationBarItem(
                icon: currentindex == 3
                    ? Image.asset("assets/logo/activeprofile.png")
                    : Column(
                        children: [
                          Image.asset("assets/logo/Ellipse_736.png"),
                          SizedBox(
                            height: 3,
                          ),
                          Image.asset("assets/logo/Path_33945.png")
                        ],
                      ),
                title: Text("Profile"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
