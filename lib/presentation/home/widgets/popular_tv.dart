import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/common/helper/widgets/tv/tv_card.dart';
import 'package:tmdb_clean/core/configs/assets/app_images.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_cubit.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_tv_cubit.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingTVCubit()..getTrendingTv(),
      child: BlocBuilder<TrendingTVCubit, TrendingTVState>(
        builder: (context, state) {
          if (state is TrendingTvLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrendingTvLoaded) {
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                itemCount: state.tv.length);
          } else if (state is TrendingTvFailure) {
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
