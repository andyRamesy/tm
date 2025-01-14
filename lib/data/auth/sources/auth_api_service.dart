import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_clean/core/configs/constants/api_url.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';
import 'package:tmdb_clean/data/auth/models/signin_requrest_params.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupRequestParams params);
  Future<Either> signin(SigninRequrestParams params);
}

class AuthApiServiceImpl extends AuthService {
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

  @override
  Future<Either> signin(SigninRequrestParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.login,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
