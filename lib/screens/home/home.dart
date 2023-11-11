import 'package:flutter/material.dart';
import 'package:userlogin/constants/colors.dart';
import 'package:userlogin/constants/description.dart';
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
        backgroundColor: bgBlack,
        appBar: AppBar(
            // title: const Text("Home"),
            backgroundColor: bgBlack,
            elevation: 0,
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(bgBlack)),
                child: const Icon(Icons.logout),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            const Center(
                child: Text('Home',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.amber,
                        fontWeight: FontWeight.w600))),
            const SizedBox(
              height: 25,
            ),
            const Text(description,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Image.asset(
                'assets/images/profilepic.png',
                height: 200,
                width: 200,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  singOut() {}
}
