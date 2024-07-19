import 'package:flutter/material.dart';
import 'package:riverpod_starter/utils/color_scheme.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).extension<AppColorScheme>()!.shimmerBase,
      highlightColor:
          Theme.of(context).extension<AppColorScheme>()!.shimmerHighlight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: Card(
              child: SizedBox(
                height: 40,
                width: 40,
              ),
            ),
            title: Card(
              child: SizedBox(
                height: 20,
                width: 400,
              ),
            ),
            subtitle: Card(
              child: SizedBox(
                height: 10,
                width: 200,
              ),
            ),
            trailing: Card(
              child: SizedBox(
                height: 10,
                width: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
