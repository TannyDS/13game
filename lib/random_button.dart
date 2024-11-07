import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RandomButton extends StatelessWidget {
  RandomButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.red,
        child: Center(
          child: Text(
            'จั่วไพ่',
            style: GoogleFonts.notoSerifThai(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
