import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_clean/common/helper/navigation/app_navigation.dart';
import 'package:tmdb_clean/common/helper/widgets/appbar/app_bar.dart';
import 'package:tmdb_clean/core/configs/assets/app_vectors.dart';
import 'package:tmdb_clean/core/configs/theme/app_colors.dart';
import 'package:tmdb_clean/domain/auth/usecases/logout.dart';
import 'package:tmdb_clean/presentation/auth/pages/signin.dart';
import 'package:tmdb_clean/presentation/home/widgets/category_text.dart';
import 'package:tmdb_clean/presentation/home/widgets/trending.dart';
import 'package:tmdb_clean/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _logout(BuildContext context) {
    return InkWell(
      onTap: () async {
        sl<LogoutUseCase>().call(null);
        AppNavigation.push(context, SigninPage());
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.logout,
          color: AppColors.primary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
          hideBack: false,
          leading: SvgPicture.asset(AppVectors.logo),
          action: _logout(context)),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings ',),
            TrendingMovies(),
            SizedBox(height: 16,),
            CategoryText(title: 'Now Playing  ',),

          ],
        ),
      ),
    );
  }
}
