import 'package:diet/main.dart';
import 'package:diet/screens/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController eController = TextEditingController();
  TextEditingController pController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      //show alert box
      Uihelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: "HomePage")));
          return null;
        });
      } on FirebaseAuthException catch (e) {
        //yet to implement
        return Uihelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.CustomTextField(eController, "email", Icons.email, false),
          Uihelper.CustomTextField(
              pController, "password", Icons.password, true),
          const SizedBox(
            height: 30,
            width: 150,
          ),
          Uihelper.CustomButton(() {
            signUp(eController.text.toString(), pController.text.toString());
          }, "Signup")
        ],
      ),
    );
  }
}
