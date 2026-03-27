import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  Future<void> signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth")),
      body: Column(
        children: [
          TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email")),
          TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password")),
          ElevatedButton(onPressed: login, child: const Text("Login")),
          ElevatedButton(onPressed: signup, child: const Text("Signup")),
        ],
      ),
    );
  }
}
