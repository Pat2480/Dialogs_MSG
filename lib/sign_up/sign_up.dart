import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbutton.dart';
import 'package:onboarding_screen/component/my_textbutton.dart';

import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onboarding_screen/component/palette.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();

  void createUserWithEmailAndPassword() async {
    final email = emailController.text;
    final password = passwordController.text;
    final cpassword = cpasswordController.text;

    if (email.isEmpty || password.isEmpty || cpassword.isEmpty) {
      _showMyDialog('Error', 'Please fill in all fields.');
      return;
    }

    if (password != cpassword) {
      _showMyDialog('Error', 'Passwords do not match.');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _showMyDialog('Success', 'Registration successful.');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'email-already-in-use') {
        _showMyDialog('Error', 'Email is already in use.');
      } else if (e.code == 'invalid-email') {
        _showMyDialog('Error', 'Invalid email format.');
      } else {
        _showMyDialog('Error', 'An error occurred. Please try again later.');
      }
    }
  }

  // createUserWithEmailAndPassword() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print('Failed with error code: ${e.code}');
  //     print(e.message);

  //     if (e.code == 'invalid-email') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  void signUpUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print("It's ok");
    } else {
      print('Please input your email and password.');
    }
  }

  void _showMyDialog(String title, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Hello, ready to get started?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign up with your email and password",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: cpasswordController,
                hintText: 'Confirm your password',
                labelText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),

              MyButton(
                  onTap: createUserWithEmailAndPassword, hintText: 'Sign Up'),

              const SizedBox(
                height: 25,
              ),
              //Icon button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              Positioned(
                top: MediaQuery.of(context).size.height - 100,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextButton(
                              MdiIcons.apple, "Apple", Palette.appleColor),
                          buildTextButton(MdiIcons.googlePlus, "Google",
                              Palette.googleColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const MyTextButton(
                      lableText: 'login now',
                      pageRoute: 'login',
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
