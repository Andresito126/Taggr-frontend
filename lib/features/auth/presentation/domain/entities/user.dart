class User {
  final String id;
  final String? username;
  final String? email;
  final String? bio;
  final String? avatarUrl;
  final DateTime? createdAt;

  User({
    required this.id,
    this.username,
    this.email,
    this.bio,
    this.avatarUrl,
    this.createdAt,
  });
}