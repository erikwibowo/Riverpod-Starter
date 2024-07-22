import 'package:flutter/material.dart';
import 'package:riverpod_starter/models/movie_model.dart';
import 'package:riverpod_starter/screens/widgets/system_ui.dart';
import 'package:riverpod_starter/utils/format_helper.dart';
import 'package:riverpod_starter/utils/ui.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SystemUi(
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.title.toString()),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppUi.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppUi.radius),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    height: 500,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                movie.title.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                FormatHelper.dateFormat(
                  movie.releaseDate.toString(),
                ),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const SizedBox(width: 4.0),
                  Text(
                    movie.voteAverage.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                'Genres: Action, Adventure, Fantasy',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Deskripsi',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                movie.overview.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Watch Trailer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
