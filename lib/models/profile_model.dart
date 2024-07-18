class Profile {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String? twoFactorConfirmedAt;
  final int? currentTeamId;
  final String? profilePhotoPath;
  final String createdAt;
  final String updatedAt;
  final String profilePhotoUrl;
  final String verifiedAt;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
    required this.verifiedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profilePhotoUrl: json['profile_photo_url'],
      verifiedAt: json['verified_at'],
    );
  }
}
