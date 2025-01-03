import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupRequestParams params) {
    throw UnimplementedError();
  }
}
