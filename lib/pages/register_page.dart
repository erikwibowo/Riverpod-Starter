import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/pages/home_page.dart';
import 'package:riverpod_starter/utils/config.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                TextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Nama Lengkap',
                    hintText: "Nama Lengkap Anda",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppUi.radius),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Email',
                    hintText: "nama@email.com",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppUi.radius),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Kata Sandi',
                    hintText: "********",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppUi.radius),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_rounded),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Konfirmasi Kata Sandi',
                    hintText: "********",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppUi.radius),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_rounded),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(
                  height: AppUi.sizeboxMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButton(
                    onPressed: () => Get.to(const HomePage()),
                    style: FilledButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: AppUi.paddingMedium),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppUi.radius),
                      ),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppUi.radius),
                        ),
                      ),
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
