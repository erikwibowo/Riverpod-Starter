import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_starter/models/profile_model.dart';
import 'package:riverpod_starter/utils/config.dart';
import 'package:riverpod_starter/utils/shared_preference.dart';

final profileProvider = FutureProvider<Profile>(
  (ref) async {
    try {
      String? token = SharedPreferencesHelper.instance.getString("token");
      final response = await http.get(
        Uri.parse("${AppConfig.baseUrl}/user"),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final profile = Profile.fromJson(responseBody['data']);
        return profile;
      } else {
        throw Exception("Failed to load profile: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error loading profile: $e");
    }
  },
);
