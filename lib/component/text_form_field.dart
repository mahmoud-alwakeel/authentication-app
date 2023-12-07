import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  const CustomTextFormField({super.key, required this.hintText, required this.myController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: hintText,
                ),
              );
  }
}