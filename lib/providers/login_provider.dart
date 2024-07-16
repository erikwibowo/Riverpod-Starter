import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpod_starter/models/login_model.dart';
import 'package:riverpod_starter/utils/config.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginModel?>>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<AsyncValue<LoginModel?>> {
  LoginNotifier() : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await http.post(
        Uri.parse("${AppConfig.baseUrl}/login"),
        headers: {'Accept': 'application/json'},
        body: {
          'email': email,
          'password': password,
        },
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final loginResponse = LoginModel.fromJson(jsonResponse);
        state = AsyncValue.data(loginResponse);
      } else {
        state = AsyncValue.error(jsonResponse['message'], StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
