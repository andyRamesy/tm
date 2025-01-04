import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_clean/core/configs/constants/api_url.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupRequestParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupRequestParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}


class AuthFirebaseServiceImpl extends AuthApiService {
  
  @override
  Future<Either> signup(SignupRequestParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
