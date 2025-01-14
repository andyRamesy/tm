import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_clean/common/helper/widgets/appbar/app_bar.dart';
import 'package:tmdb_clean/core/configs/assets/app_vectors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
    );
  }
}
