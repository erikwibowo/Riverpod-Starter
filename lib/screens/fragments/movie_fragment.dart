import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/providers/movie_provider.dart';
import 'package:riverpod_starter/screens/pages/movie_detail_page.dart';
import 'package:riverpod_starter/screens/shimmers/list_shimmer.dart';
import 'package:riverpod_starter/screens/widgets/system_ui.dart';
import 'package:riverpod_starter/utils/state.dart';
import 'package:riverpod_starter/utils/ui.dart';

class MovieFragment extends ConsumerWidget {
  const MovieFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieProvider);
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(movieProvider.notifier).fetchMovies();
      }
    });

    return SystemUi(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              filled: false,
              hintText: "Cari film",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            return ref.refresh(movieProvider.notifier);
          },
          child: ref.watch(movieProvider.notifier).isLoading
              ? const ListShimmer(count: 10)
              : ListView.builder(
                  controller: scrollController,
                  itemCount: movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == movies.length) {
                      return const ListShimmer();
                    }
                    final movie = movies[index];
                    return ListTile(
                      onTap: () => Get.to(MovieDetailPage(movie: movie)),
                      title: Text(
                        movie.title.toString(),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      subtitle: Text(
                        movie.overview.toString(),
                        maxLines: 2,
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(AppUi.radius),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          width: 50,
                          'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
