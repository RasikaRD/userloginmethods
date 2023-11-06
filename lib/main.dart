import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlogin/firebase_options.dart';
import 'package:userlogin/models/UserModel.dart';
import 'package:userlogin/screens/wrapper.dart';
import 'package:userlogin/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthService().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper()),
    );
  }
}
