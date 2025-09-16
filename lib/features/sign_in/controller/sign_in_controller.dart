import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/api_response.dart';
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
      ApiResponse<LoginResponseData> apiResponse;

      if (isSocialLogin) {
        // Implémentez la logique pour les connexions sociales ici
        apiResponse = await _handleSocialLogin();
      } else {
        // CHOISISSEZ UNE SEULE OPTION :

        // Option 1: Authentification directe avec votre backend
        apiResponse = await _loginWithBackend(email, password);

        // Option 2: Authentification Firebase puis backend (décommentez si nécessaire)
        // apiResponse = await _loginWithFirebaseThenBackend(email, password);
      }

      if (apiResponse.isSuccess() && apiResponse.data != null) {
        await _processSuccessfulLogin(apiResponse.data!);
      } else {
        toastInfo(apiResponse.message ?? "Authentication failed");
      }
    } on FirebaseAuthException catch (e) {
      handleFirebaseError(e);
    } catch (e) {
      print("Sign in error: $e");
      toastInfo("An unexpected error occurred. Please try again.");
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResponse<LoginResponseData>> _loginWithBackend(
      String email, String password) async {
    LoginRequest request = LoginRequest(email: email, password: password);
    return await SignInRepo.loginWithEmailPassword(request);
  }

  Future<ApiResponse<LoginResponseData>> _loginWithFirebaseThenBackend(
      String email, String password) async {
    try {
      // 1. Authentification Firebase
      final credential = await SignInRepo.firebaseSignIn(email, password);
      if (credential.user == null) {
        return ApiResponse<LoginResponseData>(
          status: "error",
          message: "Firebase authentication failed",
          data: null,
          metaData: null,
        );
      }

      // 2. Récupération du token Firebase
      String? idToken = await credential.user?.getIdToken();
      if (idToken == null) {
        return ApiResponse<LoginResponseData>(
          status: "error",
          message: "Failed to get Firebase token",
          data: null,
          metaData: null,
        );
      }

      // 3. Authentification avec le backend utilisant le token Firebase
      return await SignInRepo.loginWithFirebaseToken(idToken);
    } on FirebaseAuthException catch (e) {
      return ApiResponse<LoginResponseData>(
        status: "error",
        message: "Firebase error: ${e.message}",
        data: null,
        metaData: null,
      );
    }
  }

  Future<ApiResponse<LoginResponseData>> _handleSocialLogin() async {
    // Implémentez la logique pour les connexions sociales
    return ApiResponse<LoginResponseData>(
      status: "error",
      message: "Social login not implemented",
      data: null,
      metaData: null,
    );
  }

  Future<void> _processSuccessfulLogin(LoginResponseData response) async {
    try {
      // 1. Sauvegarde des tokens
      await SignInRepo.saveTokens(response.accessToken, response.refreshToken);

      // 2. Sauvegarde du token d'accès
      Global.storageServices
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, response.accessToken);

      // 3. Sauvegarde de l'utilisateur COMPLET (données fraîches du backend)
      final userJson = json.encode(response.user.toJson());
      Global.storageServices
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, userJson);

      print('Utilisateur sauvegardé: ${response.user.name}');

      // 4. Vérification du token (optionnel - pour debug)
      final decodedToken = decodeJWT(response.accessToken);
      if (decodedToken != null) {
        print('✅ Token valide pour: ${decodedToken['name']}');
      }

      // 5. Navigation
      navKey.currentState
          ?.pushNamedAndRemoveUntil("/application", (route) => false);
    } catch (e) {
      print('Erreur lors de la sauvegarde: $e');
      toastInfo('Login successful but storage error occurred');
    }
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
