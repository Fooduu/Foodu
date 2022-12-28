import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:foodu/constants.dart';
import 'package:foodu/views/components/already_have_an_account_check.dart';
import 'package:foodu/views/components/round_password_field.dart';
import 'package:foodu/views/components/rounded_button.dart';
import 'package:foodu/views/components/rounded_input_field.dart';
import 'package:foodu/views/login_page.dart';
import 'package:foodu/views/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  // hold the input email and password from register
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This is provides the total width and height of our screen
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign Up",
              style: TextStyle(
                  color: buttonColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            // Empty box to create white space
            SizedBox(height: size.height * 0.3),
            // Email text field
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
              controller: _controllerEmail,
            ),
            // Password text field
            RoundedPasswordField(
              onChanged: (value) {},
              controller: _controllerPassword,
            ),
            // Button that takes user data and creates account. It then takes you to the main page.
            RoundedButton(
              text: "SIGN UP",
              press: () async {
                // calls the method 'signInWithEmailAndPassword' from FirebaseAuth in which we are using to sign in. This method takes two arguments 'email' and 'password' which are stored in the controller
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text)
                    .then((value) {
                  FirebaseFirestore.instance
                      .collection('Users')
                      .doc(value.user?.uid)
                      .set({
                        "email": value.user?.email,
                        });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Main_Page();
                      },
                    ),
                  );
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              },
            ),
            // Empty box to create white space
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
