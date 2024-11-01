import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/login.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(String email, String password) async {
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

      // Check if response is a Map and contains expected data
      if (response is Map<String, dynamic> && response.containsKey('accessToken')) {
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



  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
