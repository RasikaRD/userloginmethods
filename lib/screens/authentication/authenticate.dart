import 'package:flutter/material.dart';
import 'package:userlogin/screens/authentication/login.dart';
import 'package:userlogin/screens/authentication/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool singinPage = true;
  // switchpage
  void switchPages() {
    setState(() {
      singinPage = !singinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singinPage == true) {
      return Login(toggle: switchPages,);
    } else {
      return Register(toggle: switchPages,);
    }
  }
}
