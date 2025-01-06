import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:tmdb_clean/common/helper/navigation/app_navigation.dart';
import 'package:tmdb_clean/data/auth/models/signup_request_params.dart';
import 'package:tmdb_clean/data/auth/repositories/auth/auth.dart';
import 'package:tmdb_clean/data/auth/sources/auth_api_service.dart';
import 'package:tmdb_clean/domain/auth/usecases/signup.dart';
import 'package:tmdb_clean/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupPage({super.key});

  Widget _signupText() {
    return const Text(
      'Sign up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      onPressed: () async {
        await SingupUseCase(
                authRepository:
                    AuthRepositoryImpl(authApiService: AuthApiServiceImpl()))
            .call(SignupRequestParams(
                email: _emailController.text,
                password: _passwordController.text));
      },
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signupTextButton(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: 'Already have account ? '),
      TextSpan(
          text: 'Sign in',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, const SigninPage());
            })
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            const SizedBox(
              height: 30,
            ),
            _emailField(),
            const SizedBox(
              height: 30,
            ),
            _passwordField(),
            const SizedBox(
              height: 30,
            ),
            _signinButton(),
            const SizedBox(
              height: 30,
            ),
            _signupTextButton(context)
          ],
        ),
      ),
    );
  }
}
