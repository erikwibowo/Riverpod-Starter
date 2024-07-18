import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:riverpod_starter/pages/home_page.dart';
import 'package:riverpod_starter/pages/login_page.dart';
import 'package:riverpod_starter/providers/theme_provider.dart';
import 'package:riverpod_starter/utils/shared_preference.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await SharedPreferencesHelper.instance.init();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLogin =
        SharedPreferencesHelper.instance.getBool("isLogin") ?? false;

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id'),
      ],
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider).themeMode,
      theme: themeLight,
      darkTheme: themeDark,
      home: isLogin ? const HomePage() : const LoginPage(),
    );
  }
}
