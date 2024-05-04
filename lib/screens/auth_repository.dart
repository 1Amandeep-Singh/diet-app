import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Making a provider for this class to use anywhere in the application instead of making instance of GoogleSignIn class everywhere/
final authRepositoryProvider =
    Provider((ref) => AuthRepository(googleSignIn: GoogleSignIn()));

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  AuthRepository({required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      // print("User is not null with email: ${user.email}");
    }
  }
}
