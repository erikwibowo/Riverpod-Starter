import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/fragments/home_fragment.dart';
import 'package:riverpod_starter/fragments/notification_fragment.dart';
import 'package:riverpod_starter/fragments/profile_fragment.dart';
import 'package:riverpod_starter/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void dispose() {
    ref.read(pageControllerProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SystemUi(
      child: Scaffold(
        body: PageView(
          controller: ref.read(pageControllerProvider),
          onPageChanged: (index) {
            ref.read(bottomNavigationBarProvider.notifier).state = index;
          },
          children: const [
            HomeFragment(),
            NotificationFragment(),
            ProfileFragment(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).canvasColor,
          onDestinationSelected: (index) {
            ref.watch(pageControllerProvider).jumpToPage(index);
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
