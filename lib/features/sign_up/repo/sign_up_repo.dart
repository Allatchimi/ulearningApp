

import 'package:firebase_auth/firebase_auth.dart';

class SingUpRepo{
  static Future<UserCredential> firebaseSignUp(String email, String password) async {
    final credentiel = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credentiel;
  }
}