import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/domain/tv/repositories/tv.dart';

import '../../../service_locator.dart';

class GetTrendingTvUseCase extends UseCase<Either, dynamic>{
  @override
  Future<Either> call(params) async{
    return await sl<TvRepository>().getTrendingTv();
  }

}