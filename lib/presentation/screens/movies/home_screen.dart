import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomeBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return FullScreenLoader();

    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: moviesSlideshow),

                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'Lunes 20',
                  loadNextPage: ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage,
                ),
                MoviesHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Próximamente',
                  subtitle: 'Este mes',
                  loadNextPage: ref
                      .read(upcomingMoviesProvider.notifier)
                      .loadNextPage,
                ),
                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage: ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage,
                ),
                MoviesHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejores calificadas',
                  subtitle: 'De todos los tiempos',
                  loadNextPage: ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage,
                ),
                SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
