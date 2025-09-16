import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/api_response.dart';
import 'package:ulearning_app/common/models/login.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class SignInRepo {
  
  static Future<UserCredential> firebaseSignIn(
      String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<ApiResponse<LoginResponseData>> login(LoginRequest request) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/login',
        data: request.toJson(),
      );

      // Parse la réponse avec ApiResponse
      return ApiResponse<LoginResponseData>.fromJson(
        response,
        (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
      );

    } catch (e) {
      print("Login error: $e");
      // Retourne une ApiResponse d'erreur au lieu de null
      return ApiResponse<LoginResponseData>(
        status: "error",
        message: "Login failed: $e",
        data: null,
        metaData: null,
      );
    }
  }

  static Future<ApiResponse<LoginResponseData>> loginWithFirebaseToken(String idToken) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/firebase-login',
        data: {'idToken': idToken},
      );

      return ApiResponse<LoginResponseData>.fromJson(
        response,
        (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
      );

    } catch (e) {
      print("Firebase token login error: $e");
      return ApiResponse<LoginResponseData>(
        status: "error",
        message: "Firebase login failed: $e",
        data: null,
        metaData: null,
      );
    }
  }

  static Future<ApiResponse<LoginResponseData>> loginWithEmailPassword(
      LoginRequest request) async {
    try {
      final response = await HttpUtil().post(
        '/api/auth/login',
        data: request.toJson(),
      );

      return ApiResponse<LoginResponseData>.fromJson(
        response,
        (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
      );

    } catch (e) {
      print("Email/password login error: $e");
      return ApiResponse<LoginResponseData>(
        status: "error", 
        message: "Email login failed: $e",
        data: null,
        metaData: null,
      );
    }
  }

  static Future<ApiResponse<LoginResponseData>> loginWithGoogle() async {
    try {
      // 1. Implémentez Google Sign-In ici
      // 2. Récupérez le idToken
      // 3. Utilisez loginWithFirebaseToken
      
      // Exemple simplifié :
      final idToken = await _getGoogleIdToken();
      return await loginWithFirebaseToken(idToken);
      
    } catch (e) {
      print("Google login error: $e");
      return ApiResponse<LoginResponseData>(
        status: "error",
        message: "Google login failed: $e",
        data: null,
        metaData: null,
      );
    }
  }

  // Méthode helper pour Google Sign-In (à implémenter)
  static Future<String> _getGoogleIdToken() async {
    // Implémentez la logique Google Sign-In
    throw UnimplementedError("Google Sign-In not implemented");
  }

  static Future<ApiResponse<LoginResponseData>> loginWithFacebook() async {
    // Même pattern que Google
    return ApiResponse<LoginResponseData>(
      status: "error",
      message: "Facebook login not implemented",
      data: null,
      metaData: null,
    );
  }

  static Future<ApiResponse<LoginResponseData>> loginWithApple() async {
    // Même pattern que Google
    return ApiResponse<LoginResponseData>(
      status: "error", 
      message: "Apple login not implemented",
      data: null,
      metaData: null,
    );
  }

  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}