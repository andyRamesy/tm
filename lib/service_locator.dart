import 'package:get_it/get_it.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
}
