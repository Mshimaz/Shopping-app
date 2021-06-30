import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInTextBox extends StatelessWidget {
  final bool isPassword;
  final String displayLogo;
  final String displayHintText;
  void Function(String val) onChange;
  void Function(String val) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  SignInTextBox(
      {this.isPassword = false,
      @required this.displayLogo,
      @required this.displayHintText,
      @required this.onChange,
      @required this.onSubmitted,
      this.focusNode,this.textInputAction});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        height: 57,
        margin: EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
                  height: 45,
                  width: 48,
                  margin: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffFFECD9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(displayLogo),
                ),
          ],
        ),
      ),
        Container(
          margin: EdgeInsets.only(left: 80,top: 25),
          child: TextField(
            decoration: InputDecoration(
              hintText: displayHintText,
              border: InputBorder.none,
            ),
            onChanged: onChange,
            obscureText: isPassword,
            onSubmitted: onSubmitted,
          ),
        )
      ]
    );
  }
}
