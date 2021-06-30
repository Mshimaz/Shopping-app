import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final bool isLoading;
  final String text;
  final double width;
  CustomButton({this.onPressed,this.isLoading,this.text,this.width = 205});
  @override
  Widget build(BuildContext context) {
    bool _isLoading = isLoading ?? false ;
    return Container(
      child: Stack(
        children: [
          Visibility(
           visible: _isLoading ? false :true,
            child: Container(
              height: 59,
              width: width,
              decoration: BoxDecoration(
                color: Color(0xff6495ED),
                borderRadius: BorderRadius.circular(133),
              ),
              child: MaterialButton(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed:onPressed,
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: Center(
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
