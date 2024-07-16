import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/providers/theme_provider.dart';

class ThemeAction extends ConsumerWidget {
  const ThemeAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<ThemeMode>(
      icon: ref.watch(themeProvider).themeMode == ThemeMode.light
          ? const Icon(Icons.light_mode_rounded)
          : ref.watch(themeProvider).themeMode == ThemeMode.dark
              ? const Icon(Icons.dark_mode_rounded)
              : MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? const Icon(Icons.dark_mode_rounded)
                  : const Icon(Icons.light_mode_rounded),
      onSelected: (ThemeMode mode) {
        ref.watch(themeProvider).toggleTheme(mode);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(Icons.light_mode_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Terang'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(Icons.dark_mode_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Gelap'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(Icons.phone_android_rounded),
              SizedBox(
                width: 10,
              ),
              Text('Otomatis'),
            ],
          ),
        ),
      ],
    );
  }
}
