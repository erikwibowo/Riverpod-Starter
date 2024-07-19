import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_starter/models/product_model.dart';

final productProvider = FutureProvider<List<Product>>(
  (ref) async {
    await Future.delayed(const Duration(seconds: 10));
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products?limit=20'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final List result = responseBody;
        return result.map(((e) => Product.fromJson(e))).toList();
      } else {
        throw Exception("Failed to load product: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error loading product: $e");
    }
  },
);
