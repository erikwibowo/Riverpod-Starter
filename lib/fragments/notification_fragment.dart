import 'package:flutter/material.dart';
import 'package:riverpod_starter/widgets/system_ui.dart';

class NotificationFragment extends StatelessWidget {
  const NotificationFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SystemUi(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Pemberitahuan"),
        ),
      ),
    );
  }
}
