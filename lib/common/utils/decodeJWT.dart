import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

// Retourne un Map avec toutes les infos utilisateur du token
Map<String, dynamic>? decodeJWT(String token) {
  try {
    final jwt = JWT.decode(token);
    final payload = jwt.payload;
    print('Payload complet: $payload');

    // Convertir en Map<String, dynamic>
    return Map<String, dynamic>.from(payload);
  } catch (e) {
    print("Erreur lors du décodage du token : $e");
    return null;
  }
}