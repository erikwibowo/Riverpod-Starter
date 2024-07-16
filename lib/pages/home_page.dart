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
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageController = PageController(
      initialPage: ref.watch(bottomNavigationBarProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SystemUi(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
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
            _pageController.jumpToPage(index);
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
