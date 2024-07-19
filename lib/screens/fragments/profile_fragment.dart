import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/providers/auth_provider.dart';
import 'package:riverpod_starter/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_starter/providers/profile_provider.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/screens/widgets/system_ui.dart';

class ProfileFragment extends ConsumerWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    return SystemUi(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(profileProvider.future),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: AppUi.sizeboxSmall),
            Column(
              children: [
                ClipOval(
                  child: SvgPicture.network(
                    'https://www.svgrepo.com/show/5125/avatar.svg',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: AppUi.sizeboxSmall),
                Text(
                  profileState.when(
                    data: (data) => data.name.toString(),
                    error: (error, stackTrace) => "Tidak dapat memuat data",
                    loading: () => "...",
                  ),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  profileState.when(
                    data: (data) => data.email.toString(),
                    error: (error, stackTrace) => "Tidak dapat memuat data",
                    loading: () => "...",
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(height: AppUi.sizeboxLarge),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Akun'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: const Text('Pengaturan'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: const Text('Tentang'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Keluar'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pemberitahuan'),
                      content: const Text(
                        'Apakah kamu yakin akan keluar dari aplikasi?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(bottomNavigationBarProvider.notifier)
                                .state = 0;
                            ref.read(logoutProvider).logout();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.error),
                          child: const Text('Keluar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
