import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/sign_up/sign_up.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.lableText,
    required this.pageRoute,
  });

  final String lableText;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              if (pageRoute == 'register') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SignUpScreen()),
                );
              } else if (pageRoute == 'login') {
                // Use Navigator.pop to go back to the previous screen (Sign-In)
                Navigator.pop(context);
              }
            },
            child: Text(
              lableText,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
