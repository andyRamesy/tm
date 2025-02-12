import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/common/helper/mapper/tv_mapper.dart';
import 'package:tmdb_clean/data/tv/models/tv.dart';
import 'package:tmdb_clean/data/tv/sources/tv.dart';
import 'package:tmdb_clean/domain/tv/repositories/tv.dart';

import '../../../service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getTrendingTv() async {
    var returnedData = await sl<TVService>().getPopularTv();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      print("data tv encoded: ${data['data']['results']}");
      var tvs = List.from(data['data']['results'])
          .map((item) => TVMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(tvs);
    });
  }
}
