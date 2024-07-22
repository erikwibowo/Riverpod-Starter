import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/login_model.dart';
import 'package:riverpod_starter/services/auth_service.dart';
import 'package:riverpod_starter/screens/pages/home_page.dart';
import 'package:riverpod_starter/screens/pages/login_page.dart';
import 'package:riverpod_starter/utils/state.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<LoginModel?>>((ref) {
  return LoginNotifier();
});

final logoutProvider = Provider((ref) {
  return LogoutNotifier();
});

class LoginNotifier extends StateNotifier<AsyncValue<LoginModel?>> {
  LoginNotifier() : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final loginResponse = await AuthService().login(email, password);
      state = AsyncValue.data(loginResponse);
      Get.offAll(const HomePage());
    } catch (e) {
      Get.errorSnackBar(e.toString());
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}

class LogoutNotifier {
  Future<void> logout() async {
    await AuthService().logout();
    Get.offAll(const LoginPage());
  }
}
