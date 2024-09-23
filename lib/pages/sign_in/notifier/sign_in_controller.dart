import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

import '../../../common/entities/user.dart';
import '../../../common/global_loader/global_loader.dart';
import '../../../common/widgets/pop_messages.dart';

class SignInController {
  WidgetRef ref;

  SignInController(this.ref);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;


    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("Your Password is empty");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credentiel = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credentiel.user == null) {
        toastInfo("user not found");
        return;
      }
      if (!credentiel.user!.emailVerified) {
        toastInfo("Your must verify your email adress first");
        return;
      }
      var user = credentiel.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        print("user logged in");
      } else {
        toastInfo("login erreur");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("user not found");
      } else if (e.code == 'wrong-password') {
        toastInfo("your password is wrong");
      }
      print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

     // ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    //ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
