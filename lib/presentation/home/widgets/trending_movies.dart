import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/core/configs/assets/app_images.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_cubit.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingMoviesLoaded) {
           return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies!.map((item) => AppImages.movieImageBasePath + item.posterPath).toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }else if(state is TrendingMoviesFailure){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
