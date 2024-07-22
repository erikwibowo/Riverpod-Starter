import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/profile_model.dart';
import 'package:riverpod_starter/services/profile_service.dart';

final profileProvider = FutureProvider<Profile>(
  (ref) async {
    return ProfileService().fetchProfile();
  },
);
