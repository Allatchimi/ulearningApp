class User {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String provider;
  final String profileImageUrl;
  String? description;
  final bool emailVerified;
  final List<String> roles;
  int? online;
  int? type;

  User({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.provider,
    required this.profileImageUrl,
    required this.emailVerified,
    required this.roles,
    this.description,
    this.online,
    this.type
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      provider: json['provider'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      emailVerified: json['emailVerified'] as bool,
      roles: List<String>.from(json['roles'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'provider': provider,
      'profileImageUrl': profileImageUrl,
      'emailVerified': emailVerified,
      'roles': roles,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, roles: $roles}';
  }
}