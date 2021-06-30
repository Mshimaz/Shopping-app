import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 60),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/logo/unknownprofile.png",
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Text(
                    "username",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset("assets/logo/wallets.png"),
              title: Text(
                "Wallets",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Image.asset("assets/logo/Group 255.png"),
              title: Text(
                "My Orders",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Image.asset("assets/logo/aboutus.png"),
              title: Text(
                "About us",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Image.asset("assets/logo/privacypolicy.png"),
              title: Text(
                "Privacy policy",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Image.asset("assets/logo/settings.png"),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Image.asset("assets/logo/log out.png"),
              title: Text(
                "Log Out",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
