import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/core/configs/theme/app_theme.dart';
import 'package:tmdb_clean/presentation/splash/bloc/splash_cubit.dart';
import 'package:tmdb_clean/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          theme: AppTheme.appTheme,
        ));
  }
}
