import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';

abstract class AuthRepository{
  Future<Either> signup(SignupRequestParams params);
}