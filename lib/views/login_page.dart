import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodu/constants.dart';
import 'package:foodu/views/components/rounded_button.dart';
import 'package:foodu/views/main_page.dart';
import 'package:foodu/views/register_page.dart';
import 'components/already_have_an_account_check.dart';
import 'components/round_password_field.dart';
import 'components/rounded_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginInScreenState createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  // hold the input email and password from register
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // This provides the total width and height of our screen
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Login",
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
            // button to login that takes you to the main page
            RoundedButton(
              text: "LOGIN",
              press: () {
                // calls the method 'signInWithEmailAndPassword' from FirebaseAuth in which we are using to sign in. This method takes two arguments 'email' and 'password' which are stored in the controller
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _controllerEmail.text,
                  password: _controllerPassword.text).then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Main_Page();
                        },
                      ),
                    );
                  });
              },
            ),
            // Empty box to create white space 
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
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
