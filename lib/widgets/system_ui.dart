import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUi extends StatelessWidget {
  final Widget child;
  const SystemUi({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Color navColor = ElevationOverlay.applySurfaceTint(
        Theme.of(context).colorScheme.surface,
        Theme.of(context).colorScheme.surface,
        3);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: navColor,
        systemNavigationBarColor: navColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
      child: child,
    );
  }
}
