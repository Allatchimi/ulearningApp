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

    print("Nom mis à jour dans nom : ${name}");


    if (name.length < 4) {
      toastInfo("Votre nom est trop court");
      return;
    }
    if (name.isEmpty) {
      toastInfo("Votre nom est vide");
      return;
    }
    if (email.isEmpty) {
      toastInfo("Votre email est vide");
      return;
    }
    if (password.isEmpty || rePassword.isEmpty) {
      toastInfo("Votre mot de passe est vide");
      return;
    }
    if (password != rePassword) {
      toastInfo("Les mots de passe ne correspondent pas");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SingUpRepo.firebaseSignUp(email, password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo("Un email de vérification a été envoyé. Veuillez vérifier votre boîte mail.");
        navKey.currentState?.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo("Ce mot de passe est trop faible");
      } else if (e.code == "email-already-in-use") {
        toastInfo("Cet email est déjà utilisé");
      } else if (e.code == "user-not-found") {
        toastInfo("Utilisateur non trouvé");
      } else {
        toastInfo("Erreur d'authentification : ${e.message}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Erreur inattendue : $e");
      }
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

}
