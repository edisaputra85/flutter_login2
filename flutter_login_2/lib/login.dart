import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textControllerUsername = TextEditingController();
  TextEditingController textControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final inputUsername = Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Inputkan nama',
            icon: Icon(Icons.person),
          ),
          controller: textControllerUsername,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: (value) {
            //validation rules
            if (value == null || value.isEmpty) {
              return "username belum diisi";
            }
          },
        ));
    final inputPassword = Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Inputkan password',
            icon: Icon(Icons.lock),
          ),
          controller: textControllerPassword,
          obscureText: true,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: (value) {
            //VALIDATION RULES
            if (value == null || value.isEmpty) {
              return "Password belum diisi";
            }
          },
        ));

    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputUsername,
                      inputPassword,
                      Center(
                          child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                  child: Text("Login"),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (textControllerUsername.text ==
                                              "admin" &&
                                          textControllerPassword.text ==
                                              "admin") {
                                        Navigator.pushNamed(
                                            context, '/dashboard',
                                            arguments:
                                                textControllerUsername.text);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "Username dan password salah"),
                                        ));
                                      }
                                    }
                                  })))
                    ],
                  ),
                )
              ],
            )));
  }
}
