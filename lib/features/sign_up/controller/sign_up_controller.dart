import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/pop_messages.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../main.dart';
import '../repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // Validation des champs
    if (name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }
    if (name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if (password.isEmpty || rePassword.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }
    if (password != rePassword) {
      toastInfo("Your passwords do not match");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    Future.delayed(const Duration(seconds: 3), () async {
      try {
        final credential = await SingUpRepo.firebaseSignUp(email, password);

        if (credential.user != null) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          toastInfo("An email has been sent to verify your account. Please check your email.");
          navKey.currentState?.pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          toastInfo("This password is too weak");
        } else if (e.code == "email-already-in-use") {
          toastInfo("This email address has already been registered");
        } else if (e.code == "user-not-found") {
          toastInfo("User not found");
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        ref.read(appLoaderProvider.notifier).setLoaderValue(false);
      }
    });
  }
}
