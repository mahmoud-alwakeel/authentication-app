import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      child: Image.network('https://picsum.photos/100/100'),
    );
  }
}
