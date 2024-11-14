import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWhite extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final TextAlign? align;
  final bool? softWrap;
  final TextOverflow? overflow;

  const CustomTextWhite({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    this.align,
    this.softWrap,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      softWrap: softWrap,
      overflow: overflow,
      style: GoogleFonts.bentham(
        color: Colors.white,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
