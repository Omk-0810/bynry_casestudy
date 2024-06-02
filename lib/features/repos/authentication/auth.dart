import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:bynry_casestudy/features/login/login_screen.dart';

class Repo{
  final _auth=FirebaseAuth.instance;
  Future<User?> createUserWithUsernamePassword(String email,String password) async {
    try {
      final UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }on FirebaseAuthException catch (e) {
    Get.snackbar("Invalid credentials", e.code);
    } catch (e) {
    Get.snackbar("error msg", e.toString());
    }
    return null;

  }
  Future<void> sendEmailVerificationLink(User user) async {
    await user.sendEmailVerification().then((value)=>{
      Get.snackbar('Link sent','A link has been sent to your email',)
    });
  }
  reload() async {
      Get.to(LoginScreen());
  }
}