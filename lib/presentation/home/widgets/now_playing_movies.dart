import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return FanCarouselImageSlider.sliderType1(
            imagesLink: state.movies!
                .map((item) => AppImages.movieImageBasePath + item.posterPath)
                .toList(),
            isAssets: false,
            autoPlay: false,
            sliderHeight: 400,
            showIndicator: true,
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
