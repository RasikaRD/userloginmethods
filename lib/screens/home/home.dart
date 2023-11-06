import 'package:flutter/material.dart';
import 'package:userlogin/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Home"), actions: [
          ElevatedButton(
            child: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ]),
      ),
    );
  }

  singOut() {}
}
