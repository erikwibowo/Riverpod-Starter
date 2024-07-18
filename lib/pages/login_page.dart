import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/models/login_model.dart';
import 'package:riverpod_starter/pages/register_page.dart';
import 'package:riverpod_starter/providers/auth_provider.dart';
import 'package:riverpod_starter/providers/text_field_provider.dart';
import 'package:riverpod_starter/utils/config.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    ref.listen<AsyncValue<LoginModel?>>(loginProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
      );
    });
    return SystemUi(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppUi.paddingMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/logo.svg",
                      width: 50,
                    ),
                    SizedBox(
                      width: AppUi.sizeboxSmall,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConfig.appName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppConfig.appNameDetail,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppUi.sizeboxLarge,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Masuk',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    Text(
                      'Ketikkan email dan kata sandi untuk mengakses aplikasi',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  controller: ref.watch(emailControllerProvider),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: "nama@email.com",
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  controller: ref.watch(passwordControllerProvider),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: ref.watch(obscureTextProvider),
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    hintText: "********",
                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(obscureTextProvider.notifier)
                          .state = !ref.watch(obscureTextProvider),
                      icon: Icon(
                        ref.watch(obscureTextProvider)
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButton(
                    onPressed: () => ref.read(loginProvider.notifier).login(
                          ref.read(emailControllerProvider).text,
                          ref.read(passwordControllerProvider).text,
                        ),
                    child: Text(
                      loginState.when(
                        data: (data) {
                          return "Masuk";
                        },
                        skipError: true,
                        error: (error, _) => "Masuk",
                        loading: () => "Masuk...",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxLarge,
                ),
                Row(
                  children: [
                    const Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () => Get.to(const RegisterPage()),
                      child: const Text("Daftar"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
