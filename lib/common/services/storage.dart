import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/decodeJWT.dart';

class StorageServices {
  late final SharedPreferences _pref;

  Future<StorageServices> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  String getUserToken() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> remove(String key) async {
    return await _pref.remove(key);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) != null;
  }

  // Méthode pour récupérer l'utilisateur sauvegardé avec gestion d'erreur
  User? getUserProfile() {
    try {
      final profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY);
      if (profile != null && profile.isNotEmpty) {
        final profileJson = jsonDecode(profile);
        return User.fromJson(profileJson);
      }
    } catch (e) {
      print('Error reading user profile: $e');
    }
    return null;
  }

  // Méthode pour récupérer le nom depuis le token JWT
  // NOTE: Vous devez implémenter decodeJWT ailleurs ou importer l'utilitaire
  String? getUsernameFromToken() {
    try {
      final token = getUserToken();
      if (token.isNotEmpty) {
        // Vous devez implémenter decodeJWT dans un utilitaire séparé
        final decoded = decodeJWT(token); // Méthode privée ou import
        return decoded?['name'] as String?;
      }
    } catch (e) {
      print('Error getting username from token: $e');
    }
    return null;
  }

  // Méthode privée pour décoder le JWT (à implémenter ou déplacer)
  Map<String, dynamic>? _decodeJWT(String token) {
    try {
      // Implémentez votre logique de décodage JWT ici
      // Ou mieux: déplacez cette fonction dans un utilitaire séparé
      return {'name': 'User Name'}; // Exemple temporaire
    } catch (e) {
      print('JWT decoding error: $e');
      return null;
    }
  }

  // Méthode pour sauvegarder l'utilisateur complet
  Future<bool> saveUserProfile(User user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      return await setString(AppConstants.STORAGE_USER_PROFILE_KEY, userJson);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving user profile: $e');
      }
      return false;
    }
  }

  // Méthode pour effacer toutes les données utilisateur
  Future<void> clearUserData() async {
    await remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    await remove(AppConstants.STORAGE_USER_PROFILE_KEY);
  }
}