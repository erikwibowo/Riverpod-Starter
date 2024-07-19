import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color success;
  final Color info;
  final Color warning;
  final Color shimmerBase;
  final Color shimmerHighlight;

  AppColorScheme({
    this.success = Colors.green,
    this.info = Colors.lightBlue,
    this.warning = Colors.amber,
    this.shimmerBase = Colors.grey,
    this.shimmerHighlight = Colors.grey,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return AppColorScheme(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return AppColorScheme();
  }

  @override
  String toString() {
    return 'AppColorScheme(success: $success, info: $info, warning: $warning, shimmerBase: $shimmerBase, shimmerHighlight: $shimmerHighlight)';
  }

  static final light = AppColorScheme(
    success: Colors.green.shade400,
    info: Colors.lightBlue.shade400,
    warning: Colors.amber.shade400,
    shimmerBase: Colors.grey.shade300,
    shimmerHighlight: Colors.grey.shade100,
  );

  static final dark = AppColorScheme(
    success: Colors.green.shade300,
    info: Colors.lightBlue.shade300,
    warning: Colors.amber.shade300,
    shimmerBase: Colors.grey.shade800,
    shimmerHighlight: Colors.grey.shade600,
  );
}
