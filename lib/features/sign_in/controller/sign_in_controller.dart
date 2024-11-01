import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/login.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/http_util.dart';
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/main.dart';
import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/decodeJWT.dart';
import '../../../common/widgets/pop_messages.dart';
import '../../../global.dart';

class SignInController {
  SignInController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
/*
  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    // Validation des champs
    if (email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo("Your Password is empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      // Authentification avec Firebase
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user != null) {
        // Récupérer le token ID de Firebase
        String? idToken = await credential.user?.getIdToken();
        if (idToken != null) {
          // Utiliser les informations de l'utilisateur pour demander un JWT à votre API
          await handleLoginWithAPI(email, password);
        } else {
          toastInfo("Failed to retrieve Firebase ID token");
        }
      } else {
        toastInfo("Login error: User not found");
      }
    } on FirebaseAuthException catch (e) {
      handleFirebaseError(e);
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
      toastInfo("An unexpected error occurred. Please try again.");
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
*/
  Future<void> handleLoginWithAPI(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    if (email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo("Your Password is empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    // Créer une requête de connexion pour votre API
    LoginRequest request = LoginRequest(email: email, password: password);

    // Appel à l'API pour obtenir un JWT
    LoginResponse? response = await SignInRepo.login(request);

    if (response != null && response.accessToken != null) {
      await SignInRepo.saveToken(response.accessToken!);
      Global.storageServices.setString(AppConstants.STORAGE_USER_TOKEN_KEY, response.accessToken!);

      // Décoder le token et sauvegarder le nom d'utilisateur
      String? username = decodeJWT(response.accessToken!);
      if (username != null) {
        Global.storageServices.setString(AppConstants.STORAGE_USER_PROFILE_KEY, username);
      }

      // Navigation vers l'écran principal de l'application
      navKey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);
    } else {
      toastInfo(response?.message ?? "Authentication error");
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }


  void handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        toastInfo("User not found");
        break;
      case 'wrong-password':
        toastInfo("Your password is wrong");
        break;
      case 'invalid-email':
        toastInfo("Invalid email format");
        break;
      default:
        toastInfo("Authentication error: ${e.message}");
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
