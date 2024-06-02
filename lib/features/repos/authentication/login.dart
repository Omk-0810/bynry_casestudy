import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo
{
  final _auth=FirebaseAuth.instance;

  Future<UserCredential?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      // Handle login errors (refer to Firebase Auth documentation)
      print("Login error: ${e.code}");
      return null;
    } catch (e) {
      // Handle other exceptions
      print("Login error: $e");
      return null;
    }
  }
}