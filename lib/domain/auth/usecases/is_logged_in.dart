import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call(params) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
