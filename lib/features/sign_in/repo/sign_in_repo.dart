import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/login.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/login',
        data: request.toJson(),
      );

      if (response is Map<String, dynamic> &&
          response.containsKey('accessToken')) {
        return LoginResponse.fromJson(response);
      } else {
        print("Error: Unexpected response format - $response");
        return null;
      }
    } catch (e) {
      print("Connection error: $e");
      return null;
    }
  }

  static Future<LoginResponse?> loginWithFirebaseToken(String idToken) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/firebase-login', // Endpoint backend pour Firebase auth
        data: {'token': idToken},
      );

      if (response is Map<String, dynamic> &&
          response.containsKey('accessToken')) {
        return LoginResponse.fromJson(response);
      } else {
        print("Error: Unexpected response format - $response");
        return null;
      }
    } catch (e) {
      print("Firebase token login error: $e");
      return null;
    }
  }

  static Future<LoginResponse?> loginWithEmailPassword(
      LoginRequest request) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/login',
        data: request.toJson(),
      );

      if (response is Map<String, dynamic> &&
          response.containsKey('accessToken')) {
        return LoginResponse.fromJson(response);
      } else {
        print("Error: Unexpected response format - $response");
        return null;
      }
    } catch (e) {
      print("Email/password login error: $e");
      return null;
    }
  }
  
// Dans sign_in_repo.dart - Ajoutez ces méthodes
  static Future<LoginResponse?> loginWithGoogle() async {
    // Implémentez la logique Google Sign-In ici
    // 1. Authentification avec Google via Firebase
    // 2. Récupération du token
    // 3. Envoi au backend
  }

  static Future<LoginResponse?> loginWithFacebook() async {
    // Implémentez la logique Facebook Sign-In ici
  }

  static Future<LoginResponse?> loginWithApple() async {
    // Implémentez la logique Apple Sign-In ici
  }
  
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
