import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diet/main.dart';
import 'package:diet/screens/signuppage.dart';
import 'package:diet/screens/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: "HomePage")));
    }
  }

  /*Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var userSignedIn = Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "HomePage")));
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  //const HomeScreen({super.key});

  logIn(String email, String password) async {
    if (email == "" && password == "") {
      //show alert box
      return Uihelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: "HomePage")));
          return null;
        });
      } on FirebaseAuthException catch (ex) {
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Diet",
          style: TextStyle(
              color: Colors.teal, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "Let's dive into humorously healthy hacks.",
              speed: const Duration(milliseconds: 300),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        /*const Text(
          "Let's dive into humorously healthy hacks.",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),*/
        Uihelper.CustomTextField(emailcontroller, "email", Icons.email, true),
        Uihelper.CustomTextField(
            passwordcontroller, "password", Icons.password, false),
        const SizedBox(
          height: 10,
          width: 50,
        ),
        Uihelper.CustomButton(() {
          logIn(emailcontroller.text.toString(),
              passwordcontroller.text.toString());
        }, "Let's GO"),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already Have an Account??",
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ))
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'OR',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () => signInWithGoogle(context),
            // onPressed: () =>
            //     Uihelper.CustomAlertBox(context, "Yet to implement"),
            icon: Image.asset(
              'assets/images/google-logo.png',
              width: 30.0,
              height: 30.0,
            ),
            label: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign In With Google',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
