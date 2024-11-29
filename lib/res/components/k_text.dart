import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text, this.fontSize, this.fontWeight, this.color, this.textAlign});


  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
