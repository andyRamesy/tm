import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/data/auth/models/signin_requrest_params.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupRequestParams params);
  Future<Either> signin(SigninRequrestParams params);
  Future<bool> isLoggedIn();
  Future logout();
}
