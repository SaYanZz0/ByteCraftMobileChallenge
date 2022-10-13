import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key, required this.color, required this.text, this.callback})
      : super(key: key);
  final color;
  final text;
  final callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      width: 83,
      child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9))),
          child: Text(
            text,
            style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 26),
          )),
    );
  }
}
