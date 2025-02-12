import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_clean/core/configs/constants/api_url.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';

import '../../../service_locator.dart';

abstract class TVService{
  Future<Either> getPopularTv();
}

class TVApiServiceImpl extends TVService{
  @override
  Future<Either> getPopularTv() async{
    try{
      var response = await sl<DioClient>().get(ApiUrl.popular);
      return Right(response.data);
    }on DioException catch(e){
      return Left(e.response?.data['message']);
    }
  }

}