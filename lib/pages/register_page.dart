import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/pages/home_page.dart';
import 'package:riverpod_starter/providers/text_field_provider.dart';
import 'package:riverpod_starter/utils/config.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      'Daftar',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    Text(
                      'Daftarkan diri anda dan jadilah bagian dari kami',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                const TextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    hintText: "Nama Lengkap Anda",
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "nama@email.com",
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
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
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: ref.watch(obscureTextProvider),
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Kata Sandi',
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
                    onPressed: () => Get.to(const HomePage()),
                    child: const Text(
                      "Daftar",
                    ),
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxLarge,
                ),
                Row(
                  children: [
                    const Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("Masuk"),
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
