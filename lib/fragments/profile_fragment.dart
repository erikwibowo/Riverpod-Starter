import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/pages/login_page.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SystemUi(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppUi.sizeboxSmall),
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
              'Nama Pengguna',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'username@email.com',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppUi.sizeboxLarge),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Akun'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                // Navigate to My Account
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: const Text('Pengaturan'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                // Navigate to Settings
              },
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
                          onPressed: () => Get.offAll(const LoginPage()),
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
