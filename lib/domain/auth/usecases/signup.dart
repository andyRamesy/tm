import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/service_locator.dart';

class SingupUseCase extends UseCase<Either, SignupRequestParams> {
  @override
  Future<Either> call(SignupRequestParams? params) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
