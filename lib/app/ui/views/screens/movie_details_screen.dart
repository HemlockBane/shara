import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shara_movies/app/ui/view_model/movie_details_view_model.dart';
import 'package:shara_movies/app/ui/views/widgets/widgets.dart';
import 'package:shara_movies/core/data/model/movie.dart';

class MovieDetailsScreenArgs {
  MovieDetailsScreenArgs({
    required this.title,
    required this.titleId,
  });

  final String? title;
  final String? titleId;
}

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.movieDetailsScreenArgs})
      : super(key: key);

  final MovieDetailsScreenArgs movieDetailsScreenArgs;

  static MaterialPageRoute buildRoute(RouteSettings settings) {
    final args = settings.arguments as MovieDetailsScreenArgs;

    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return MovieDetailsScreen(
            movieDetailsScreenArgs: args,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsViewModel(),
      child: MovieDetailsView(
        args: movieDetailsScreenArgs,
      ),
    );
  }
}

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({
    Key? key,
    required this.args,
  }) : super(key: key);

  final MovieDetailsScreenArgs args;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  late MovieDetailsViewModel _detailsViewModel;

  @override
  void initState() {
    super.initState();
    _detailsViewModel = context.read<MovieDetailsViewModel>();
    _detailsViewModel.getMovieDetails(id: widget.args.titleId ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.args.title ?? "")),
      body: BlocBuilder<MovieDetailsViewModel, MovieDetailsUiState>(
        builder: (ctx, state) {
          if (state is LoadingState) {
            return const LoadingView();
          }

          if (state is FailureState) {
            const FailureView(message: "Error fetching movie details");
          }

          if (state is SuccessState) {
            return _SuccessView(movie: state.data,);
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key, required this.movie}) : super(key: key);

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MovieImageBanner(url: movie?.image?.url ?? "",),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie?.title ?? "--",
                style: const TextStyle(fontSize: 24),
              ),
              Text(movie?.year?.toString() ?? "", style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
        MovieSynopsis(synopsis: movie?.synopsis,)
      ],
    );
  }
}

class MovieImageBanner extends StatelessWidget {
  const MovieImageBanner({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: context.mediaSize.height * 0.38,
      width: context.mediaSize.width,
      child: Image.network(url, fit: BoxFit.fill),
    );
  }
}

class MovieSynopsis extends StatelessWidget {
  const MovieSynopsis({Key? key, required this.synopsis}) : super(key: key);

  final String? synopsis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Synopsis", style: TextStyle(fontSize: 22),),
          const SizedBox(
            height: 5,
          ),
          Text(synopsis ?? "", style: const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}

extension ContextX on BuildContext {
  Size get mediaSize {
    return MediaQuery.of(this).size;
  }
}
