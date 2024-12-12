import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:tmdb_clean/common/helper/navigation/app_navigation.dart';
import 'package:tmdb_clean/core/configs/theme/app_colors.dart';
import 'package:tmdb_clean/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(
                height: 30,
              ),
              _emailField(),
              const SizedBox(
                height: 30,
              ),
              _passwordField(),
              const SizedBox(
                height: 40,
              ),
              _signinButton(),
              const SizedBox(
                height: 30,
              ),
              _signupText(context)
            ],
          )),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign in',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      title: 'Sign in',
      activeColor: AppColors.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: 'Don\'t you have account?'),
      TextSpan(
          text: 'Sign up',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SignupPage());
            })
    ]));
  }
}
