class LoginModel {
  final dynamic message;
  final dynamic accessToken;
  final dynamic tokenType;
  final UserData data;

  LoginModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) {
    return LoginModel(
      message: json['message'],
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final dynamic id;
  final dynamic name;
  final dynamic email;
  final dynamic emailVerifiedAt;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic profilePhotoUrl;
  final List<Role>? roles;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
    required this.roles,
  });

  factory UserData.fromJson(Map<dynamic, dynamic> json) {
    var rolesFromJson = json['roles'] as List;
    List<Role> roleList =
        rolesFromJson.map((role) => Role.fromJson(role)).toList();

    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      profilePhotoUrl: json['profile_photo_url'],
      roles: roleList,
    );
  }
}

class Role {
  final dynamic id;
  final dynamic name;
  final dynamic guardName;
  final Pivot pivot;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.pivot,
  });

  factory Role.fromJson(Map<dynamic, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      guardName: json['guard_name'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  final dynamic modelType;
  final dynamic modelId;
  final dynamic roleId;

  Pivot({
    required this.modelType,
    required this.modelId,
    required this.roleId,
  });

  factory Pivot.fromJson(Map<dynamic, dynamic> json) {
    return Pivot(
      modelType: json['model_type'],
      modelId: json['model_id'],
      roleId: json['role_id'],
    );
  }
}
