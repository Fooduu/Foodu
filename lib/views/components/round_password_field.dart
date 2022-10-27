import "package:flutter/material.dart";
import 'package:foodu/constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: backgroundColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: backgroundColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
