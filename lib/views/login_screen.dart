import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locazen/global.dart';
import 'package:locazen/views/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.amber],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp)),
      child: ListView(
        children: [
          Image.asset("images/logo.png"),
          const Text(
            "Login Now ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      controller: _emailTextEditingController,
                      validator: (valueEmail) {
                        if (!valueEmail!.contains("@")) {
                          return "Please writ valid email..";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      controller: _passwordTextEditingController,
                      obscureText: true,
                      validator: (valuePassword) {
                        if (valuePassword!.length < 6) {
                          return "Please writ password length more 6..";
                        }
                        {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await userViewModel.login(
                                _emailTextEditingController.text.trim(),
                                _passwordTextEditingController.text.trim());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: EdgeInsets.symmetric(horizontal: 100)),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SignupScreen());
                      },
                      child: const Text(
                        "Vous n'avez pas de compte ? Creer un compte ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
