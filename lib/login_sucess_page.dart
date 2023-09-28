import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginSucessPage extends StatelessWidget {
  LoginSucessPage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  void _showMyDialog(BuildContext context, String title, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      _showMyDialog(
          context, 'Logout Success', 'You have been logged out successfully.');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text('SHOPs'),
        actions: [
          IconButton(
            onPressed: () => signOutUser(context),
            icon: const Icon(
              Icons.login,
              size: 30,
            ),
          )
        ],
      ),
      body: Text(
        'Hello,' + user!.email.toString(),
      ),
    );
  }
}
