import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_clean/data/auth/models/signin_requrest_params.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/data/auth/sources/auth_api_service.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupRequestParams params) async {
    var data = await sl<AuthApiService>().signup(params);
    data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']); 
      return Right(data);
    });
    return Left('Error');
  }

  @override
  Future<Either> signin(SigninRequrestParams params) async{
    var data = await sl<AuthApiService>().signin(params);
    data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
    return Left('Error');
  }
}
