import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final obscureTextProvider = StateProvider.autoDispose((ref) => true);

final emailControllerProvider = Provider((ref) => TextEditingController());
final passwordControllerProvider = Provider((ref) => TextEditingController());
