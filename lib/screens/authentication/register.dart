import 'package:flutter/material.dart';
import 'package:userlogin/constants/colors.dart';
import 'package:userlogin/constants/description.dart';
import 'package:userlogin/constants/styles.dart';
import 'package:userlogin/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

final _formkey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
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
        title: const Text('REGISTER'),
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
                    decoration: inputFormDecoration,
                    style: const TextStyle(color: Colors.white),
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
                    height: 10,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.amber),
                          padding: const EdgeInsets.all(10),
                          foregroundColor:
                              const Color.fromARGB(255, 136, 138, 139),
                          textStyle: const TextStyle(fontSize: 12)),
                      onPressed: () async {
                        dynamic result = await _auth.registerWithEmailPasssword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error = "Please enter valid email";
                          });
                        }
                      },
                      child: const Text('Register')),

                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.amber),
                          padding: const EdgeInsets.all(10),
                          foregroundColor:
                              const Color.fromARGB(255, 136, 138, 139),
                          textStyle: const TextStyle(fontSize: 12)),
                      onPressed: () {
                        widget.toggle();
                      },
                      child: const Text('Login if has an account')),
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
                      onTap: () {},
                      child: const Text(
                        "Register with Google",
                        style:
                            TextStyle(color: Color.fromARGB(255, 11, 121, 172)),
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
