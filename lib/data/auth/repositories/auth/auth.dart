import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/data/auth/sources/auth_api_service.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthApiService authApiService;

  AuthRepositoryImpl({required this.authApiService});

  @override
  Future<Either> signup(SignupRequestParams params) async {
    return await authApiService.signup(params);
  }
}

