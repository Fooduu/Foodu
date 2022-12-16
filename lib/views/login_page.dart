import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodu/constants.dart';
import 'package:foodu/views/components/rounded_button.dart';
import 'package:foodu/views/main_page.dart';
import 'package:foodu/views/register_page.dart';
import '../auth.dart';
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

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This is provides the total width and height of our screen
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              "Sign in",
              style: TextStyle(
                  color: buttonColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.3),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
              controller: _controllerEmail,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: _controllerPassword,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
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
