import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final Widget? suffixIcon;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.myController,
      required this.validator,
      required this.keyboardType,
      this.obsecureText = true,
      this.suffixIcon,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: validator,
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
