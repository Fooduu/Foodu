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
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              text: "SIGN UP",
              press: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text)
                    .then((value) {
                  print("Created New Account");
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
