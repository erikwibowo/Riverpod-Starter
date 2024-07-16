import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/fragments/home_fragment.dart';
import 'package:riverpod_starter/fragments/profile_fragment.dart';
import 'package:riverpod_starter/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SystemUi(
      child: Scaffold(
        body: IndexedStack(
          index: ref.watch(bottomNavigationBarProvider),
          children: const [
            HomeFragment(),
            HomeFragment(),
            ProfileFragment(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).canvasColor,
          onDestinationSelected: (index) {
            ref.read(bottomNavigationBarProvider.notifier).state = index;
          },
          selectedIndex: ref.watch(bottomNavigationBarProvider),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.grid_view_rounded),
              icon: Icon(Icons.grid_view),
              label: 'Beranda',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications_rounded),
              icon: Icon(Icons.notifications_outlined),
              label: 'Pemberitahuan',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_rounded),
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
