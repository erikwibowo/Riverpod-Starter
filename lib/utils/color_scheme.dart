import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color success;
  final Color info;
  final Color warning;

  AppColorScheme({
    this.success = Colors.green,
    this.info = Colors.lightBlue,
    this.warning = Colors.amber,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? success,
    Color? info,
    Color? warning,
  }) {
    return AppColorScheme(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
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
    return 'AppColorScheme(success: $success, info: $info, warning: $warning)';
  }

  static final light = AppColorScheme(
    success: Colors.green.shade400,
    info: Colors.lightBlue.shade400,
    warning: Colors.amber.shade400,
  );

  static final dark = AppColorScheme(
    success: Colors.green.shade300,
    info: Colors.lightBlue.shade300,
    warning: Colors.amber.shade300,
  );
}
