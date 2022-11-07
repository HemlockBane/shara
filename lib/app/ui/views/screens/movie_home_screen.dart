import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shara_movies/app/ui/view_model/movie_home_view_model.dart';
import 'package:shara_movies/app/ui/views/screens/movie_details_screen.dart';
import 'package:shara_movies/core/data/remote/model/movie_list_response.dart';
import 'package:shara_movies/core/navigation/app_navigation.dart';
import 'package:shara_movies/core/utils/utils.dart';

import '../widgets/widgets.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieHomeViewModel(),
      child: const MovieHomeView(),
    );
  }
}

class MovieHomeView extends StatelessWidget {
  const MovieHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          _SearchBar(),
          _SearchBody(),
        ],
      ),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MovieHomeViewModel, MovieHomeUiState>(
        builder: (ctx, state) {
          if (state is DefaultState) {
            return const DefaultView();
          }
          if (state is LoadingState) {
            return const LoadingView();
          }

          if (state is FailureState) {
            return const FailureView(message: "Search failed...",);
          }

          if (state is SuccessState) {
            return state.data.isEmpty
                ? const EmptyView(message: "No results for your search...")
                : MovieListView(data: state.data);
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  late MovieHomeViewModel _movieHomeViewModel;

  @override
  void initState() {
    super.initState();
    _movieHomeViewModel = context.read<MovieHomeViewModel>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 40),
      child: TextFormField(
        controller: _textController,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: "Type to search...",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onChanged: (String text) {
          _movieHomeViewModel.findMovie(title: text.trim());
        },
      ),
    );
  }
}

class DefaultView extends StatelessWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Search for a movie or show..."),
    );
  }
}


class MovieListView extends StatelessWidget {
  const MovieListView({Key? key, required this.data}) : super(key: key);

  final List<MovieSummary> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      separatorBuilder: (_, __) => const SizedBox(),
      itemBuilder: (ctx, idx) {
        final summary = data[idx];
        return MovieListItemView(
          data: summary,
        );
      },
    );
  }
}

class MovieListItemView extends StatelessWidget {
  const MovieListItemView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MovieSummary data;

  @override
  Widget build(BuildContext context) {
    final title = data.title ?? "--";
    final year = data.year?.toString() ?? "--";
    final imageUrl = data.image?.url ?? "--";

    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(title),
      subtitle: Text(year),
      onTap: (){
        final args = MovieDetailsScreenArgs(title: title, titleId: beautifyTitleId(data.id));
        Navigator.of(context).pushNamed(AppNavigation.movieDetails, arguments: args);
      },
    );
  }
}
