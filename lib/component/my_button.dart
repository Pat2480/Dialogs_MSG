import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.hintText});

  final Function()? onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Center(
        child: Text(
          hintText,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.titleLarge,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
