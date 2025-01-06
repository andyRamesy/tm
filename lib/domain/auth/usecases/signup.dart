import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';

class SingupUseCase extends UseCase<Either, SignupRequestParams> {
  final AuthRepository authRepository;

  SingupUseCase({required this.authRepository});
  @override
  Future<Either> call(SignupRequestParams? params) async {
    return await authRepository.signup(params!);
  }
}
