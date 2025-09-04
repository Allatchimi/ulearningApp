import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String? decodeJWT(String token) {
  try {
    final jwt = JWT.decode(token);
    final payload = jwt.payload;
    print('Payload complet: $payload');

    // Récupérer un champ pertinent
    return payload['name'] 
        ?? payload['username'] 
        ?? payload['preferred_username'] 
        ?? payload['sub']; // Ajouté pour clé souvent utilisée
  } catch (e) {
    print("Erreur lors du décodage du token : $e");
    return null;
  }
}
