import 'dart:developer';

import 'package:api1_practice/controller/api/signin_api.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: ()async {
                bool status = await SigninApi.signinapi(email: emailController.text, pass: passController.text);
                log("$status");
                if(status){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Success")));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Faild")));
                }
              },
              child: const Text("Sign"),
            ),
          ],
        ),
      ),
    );
  }
}
