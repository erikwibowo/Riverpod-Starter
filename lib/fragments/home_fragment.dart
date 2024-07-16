import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_starter/providers/bottom_navigation_bar_provider.dart';
import 'package:riverpod_starter/utils/ui.dart';
import 'package:riverpod_starter/widgets/action/theme.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class HomeFragment extends ConsumerWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SystemUi(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            ClipOval(
              child: SvgPicture.network(
                'https://www.svgrepo.com/show/5125/avatar.svg',
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: AppUi.sizeboxSmall,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang!",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "Nama Pengguna",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  )
                ],
              ),
            ),
          ],
        ),
        actions: const [
          ThemeAction(),
        ],
      ),
    ));
  }
}
