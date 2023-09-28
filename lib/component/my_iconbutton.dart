import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}

TextButton buildTextButton(IconData icon, String title, Color backgroundColor) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: const Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: backgroundColor),
    child: Row(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
        )
      ],
    ),
  );
}
