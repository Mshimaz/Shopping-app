import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/CustomButton.dart';
import 'package:shopping_app/widgets/SignInTextBox.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // Create a new user account
  Future<String> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _registerFormLoading = true;
    });

    // Run the create account method
    String _createAccountFeedback = await _createAccount();

    // If the string is not null, we got error while create account.
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      // The String was null, user is logged in.
      Navigator.pop(context);
    }
  }

  // Default Form Loading State
  bool _registerFormLoading = false;

  // Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 99,
            ),
            Container(
              height: 60,
              child: Center(
                child: Image.asset("assets/logo/Vector (1).png"),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 33,
            ),
            SignInTextBox(
              displayLogo: "assets/logo/Profile.png",
              displayHintText: "Name",
              onChange: (val) {},
              onSubmitted: (val) {},
            ),
            SignInTextBox(
              displayLogo: "assets/logo/Message.png",
              displayHintText: "Email",
              onChange: (val) {
                _registerEmail = val;
              },
              onSubmitted: (value) {
                _passwordFocusNode.requestFocus();
              },
              textInputAction: TextInputAction.next,
            ),
            SignInTextBox(
              displayLogo: "assets/logo/Lock.png",
              displayHintText: "Password",
              onChange: (value) {
                _registerPassword = value;
              },
              focusNode: _passwordFocusNode,
              onSubmitted: (value) {
                _submitForm();
              },
              isPassword: true,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              text: "Sign Up",
              onPressed: () {
                _submitForm();
              },
              isLoading: _registerFormLoading,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
