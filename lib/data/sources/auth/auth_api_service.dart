import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';
import 'package:tmdb_clean/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup() async {
    try {
      var response = await sl<DioClient>().post('');
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}