import 'package:flutter/material.dart';
import 'package:tmdb_clean/core/configs/assets/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.splashBackground))),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xff1A1B20).withOpacity(0),
              const Color(0xff1A1B20)
            ])),
          )
        ],
      ),
    );
  }
}
