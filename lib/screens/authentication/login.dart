import 'package:flutter/material.dart';
import 'package:userlogin/constants/colors.dart';
import 'package:userlogin/constants/description.dart';
import 'package:userlogin/constants/styles.dart';
import 'package:userlogin/screens/authentication/register.dart';
import 'package:userlogin/services/auth.dart';

class Login extends StatefulWidget {
  // function
  final Function toggle;
  const Login({super.key, required this.toggle});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // reference for authservice class
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  // email, password store
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text('SIGN IN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              description,
              style: descriptionStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                'assets/images/profilepic.png',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration:
                        inputFormDecoration.copyWith(hintText: "Enter Email"),
                    validator: (val) =>
                        val?.isEmpty == true ? "Enter valid email" : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: inputFormDecoration,
                    validator: (val) =>
                        val!.length < 5 ? "Enter valid password" : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.amber),
                          padding: const EdgeInsets.all(10),
                          foregroundColor:
                              const Color.fromARGB(255, 136, 138, 139),
                          textStyle: const TextStyle(fontSize: 12)),
                      onPressed: () async {
                        dynamic result = await _auth
                            .signInUsingEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = "Wrong User credintials ";
                          });
                        }
                      },
                      child: const Text('Login')),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.amber),
                          padding: const EdgeInsets.all(10),
                          foregroundColor:
                              const Color.fromARGB(255, 136, 138, 139),
                          textStyle: const TextStyle(fontSize: 12)),
                      onPressed: () async {
                        await _auth.signInAnonymously();
                      },
                      child: const Text('Login as Guest')),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: Image.asset(
                    'assets/images/google.png',
                    height: 50,
                    width: 50,
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: const Text(
                        "Register with Google",
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
      // body: ElevatedButton(
      //   child: const Text('Sign in Anonymsly'),
      //   onPressed: () async {
      //     dynamic result = await _auth.signInAnonymously();
      //     if (result == Null) {
      //       print("Error in anonymsly");
      //     } else {
      //       print("user sign in anonymsly");
      //       print(result.uid);
      //     }
      //   },
      // ),