import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/common/helper/widgets/movie/movie_card.dart';
import 'package:tmdb_clean/presentation/home/bloc/now_playing_cubit.dart';
import 'package:tmdb_clean/presentation/home/bloc/now_playing_state.dart';

import '../../../core/configs/assets/app_images.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
        if (state is NowPlayingMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NowPlayingMoviesLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(
                    movieEntity: state.movies[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                itemCount: state.movies.length),
          );
        } else if (state is NowPlayingMoviesFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Container();
      }),
    );
  }
}
