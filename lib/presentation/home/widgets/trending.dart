import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_cubit.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';

class TrendingMoviesFailure extends StatelessWidget {
  const TrendingMoviesFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoaded) {
            return const CircularProgressIndicator();
          } else if (state is TrendingMoviesLoaded) {

            //
          }
          return Container();
        },
      ),
    );
  }
}
