// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/providers/auth_provider.dart';
import 'package:weather_project/utils/Approuat.dart';
import 'package:weather_project/utils/colors.dart';
import 'package:weather_project/view/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Form(
              key: value.signupkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                        controller: value.nameController,
                        decoration: const InputDecoration(labelText: "Name"),
                        validator: (v) {
                          value.NotNullValeditor(v!);
                          return null;
                        }),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                        controller: value.mobilNumber,
                        decoration:
                            const InputDecoration(labelText: "Mobile Number"),
                        validator: (v) {
                          value.phoneValidation(v!);
                          return null;
                        }),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: value.emailController,
                      decoration: const InputDecoration(labelText: "Username"),
                      validator: (v) {
                        if (v!.length < 3) {
                          return 'name must contain at least 3 letters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: value.passwordController,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (v) {
                        if (v!.length < 3) {
                          return 'name must contain at least 3 letters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (value.signupkey.currentState!.validate()) {
                          value.Signup();
                          EasyLoading.showSuccess('SignUp Sucsess');
                          Navigator.pushNamed(context, AppRouat.home);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: LinearGradient(colors: [
                              HexColore.fromHex('#EEA47FFF'),
                              HexColore.fromHex('#00539cff'),
                              const Color(0xFF2661FA)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: const Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
