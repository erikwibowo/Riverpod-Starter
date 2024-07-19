import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/providers/product_provider.dart';
import 'package:riverpod_starter/screens/shimmers/product_shimmer.dart';
import 'package:riverpod_starter/screens/widgets/system_ui.dart';
import 'package:riverpod_starter/utils/ui.dart';

class NotificationFragment extends ConsumerWidget {
  const NotificationFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productData = ref.watch(productProvider);
    return SystemUi(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Belanja"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(productProvider.future),
          child: productData.when(
            data: (products) => ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  onTap: () {},
                  title: Text(
                    product.title.toString(),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(AppUi.radius),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      width: 50,
                      product.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: Text(
                    product.price.toString(),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                      ),
                      Text(
                        product.rating!.rate.toString(),
                      ),
                    ],
                  ),
                );
              },
            ),
            error: (error, stackTrace) => Text("error $error"),
            loading: () => const ProductShimmer(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.filter_alt),
        ),
      ),
    );
  }
}
