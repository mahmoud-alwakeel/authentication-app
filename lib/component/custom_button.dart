import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTitle;
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      color: Colors.deepPurple,
      child: Text(
        buttonTitle,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
