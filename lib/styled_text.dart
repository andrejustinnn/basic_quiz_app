import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // const StyledText(String text, {super.key}); gabisa langsung akses text di function build krna tidak terhubung
  const StyledText(this.text,
      {this.size = 28,
      this.color = Colors.white,
      super.key}); //langsung terhubung

  final String
      text; // final karena saat menggunakan widget ini hanya akan assign sekali.
  final double size;
  final Color color;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
