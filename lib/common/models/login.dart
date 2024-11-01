class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? message;

  LoginResponse({this.accessToken, this.refreshToken, this.message});

  // Method to parse JSON into LoginResponse
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      message: json['message'],
    );
  }
}
