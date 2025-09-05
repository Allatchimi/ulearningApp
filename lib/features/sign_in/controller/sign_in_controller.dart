import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/login.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/main.dart';
import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/decodeJWT.dart';
import '../../../common/widgets/pop_messages.dart';
import '../../../global.dart';

class SignInController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref, {bool isSocialLogin = false}) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    // Validation
    if (!isSocialLogin) {
      if (email.isEmpty) {
        toastInfo("Your email is empty");
        return;
      }
      if (password.isEmpty) {
        toastInfo("Your Password is empty");
        return;
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      LoginResponse? response;
      
      if (isSocialLogin) {
        // Implémentez la logique pour les connexions sociales ici
        // Cela dépendra de votre implémentation Firebase et backend
      } else {
        // Option 1: Authentification directe avec votre backend
        //response = await _loginWithBackend(email, password);
        
        // Option 2: Authentification Firebase puis backend (décommentez si nécessaire)
         response = await _loginWithFirebaseThenBackend(email, password);
      }

      if (response != null && response.accessToken != null) {
        await _processSuccessfulLogin(response);
      } else {
        toastInfo(response?.message ?? "Authentication error");
      }
    } catch (e) {
      print("Sign in error: $e");
      toastInfo("An unexpected error occurred. Please try again.");
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<LoginResponse?> _loginWithBackend(String email, String password) async {
    LoginRequest request = LoginRequest(email: email, password: password);
    return await SignInRepo.loginWithEmailPassword(request);
  }

  Future<LoginResponse?> _loginWithFirebaseThenBackend(String email, String password) async {
    try {
      // 1. Authentification Firebase
      final credential = await SignInRepo.firebaseSignIn(email, password);
      if (credential.user == null) return null;
      
      // 2. Récupération du token Firebase
      String? idToken = await credential.user?.getIdToken();
      if (idToken == null) return null;
      
      // 3. Authentification avec le backend utilisant le token Firebase
      return await SignInRepo.loginWithFirebaseToken(idToken);
    } on FirebaseAuthException catch (e) {
      handleFirebaseError(e);
      return null;
    }
  }

  Future<void> _processSuccessfulLogin(LoginResponse response) async {
    await SignInRepo.saveToken(response.accessToken!);
    Global.storageServices.setString(
      AppConstants.STORAGE_USER_TOKEN_KEY, 
      response.accessToken!
    );
    
    String? username = decodeJWT(response.accessToken!);
    if (username != null) {
      Global.storageServices.setString(
        AppConstants.STORAGE_USER_PROFILE_KEY, 
        username
      );
    }
    
    navKey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);
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
