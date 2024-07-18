class LoginModel {
  final String message;
  final String accessToken;
  final String tokenType;

  LoginModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}
