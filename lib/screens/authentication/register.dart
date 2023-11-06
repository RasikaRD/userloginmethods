import 'package:flutter/material.dart';
import 'package:userlogin/constants/colors.dart';
import 'package:userlogin/constants/description.dart';
import 'package:userlogin/constants/styles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
final _formkey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
    // email, password store
  String email = "";
  String password = "";
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
                    height: 10,
                  ),
                  TextButton(onPressed:  (){}, child: const Text('Register')),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text('Login as a gest')),
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