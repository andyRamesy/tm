import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/data/auth/models/signin_requrest_params.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninRequrestParams> {
  @override
  Future<Either> call(SigninRequrestParams params) async {
    return await sl<AuthRepository>().signin(params);
  }
}
