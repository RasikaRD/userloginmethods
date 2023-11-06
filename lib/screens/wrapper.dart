import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlogin/models/UserModel.dart';
import 'package:userlogin/screens/authentication/authenticate.dart';
import 'package:userlogin/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
