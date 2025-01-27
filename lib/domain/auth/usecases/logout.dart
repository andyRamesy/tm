import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/service_locator.dart';

class LogoutUseCase extends UseCase {
  @override
  call(params) async {
    return await sl<AuthRepository>().logout();
  }
  
}