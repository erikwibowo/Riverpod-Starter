import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/screens/fragments/home_fragment.dart';
import 'package:riverpod_starter/screens/fragments/movie_fragment.dart';
import 'package:riverpod_starter/screens/fragments/profile_fragment.dart';
import 'package:riverpod_starter/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_starter/screens/widgets/system_ui.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = ref.read(pageControllerProvider);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
            MovieFragment(),
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
              selectedIcon: Icon(Icons.movie),
              icon: Icon(Icons.movie_rounded),
              label: 'Film',
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
