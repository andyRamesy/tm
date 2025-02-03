import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_button/reactive_button.dart';
import 'package:tmdb_clean/common/helper/message/display_message.dart';
import 'package:tmdb_clean/common/helper/navigation/app_navigation.dart';
import 'package:tmdb_clean/data/auth/models/signin_requrest_params.dart';
import 'package:tmdb_clean/domain/auth/usecases/signin.dart';
import 'package:tmdb_clean/presentation/auth/pages/signup.dart';
import 'package:tmdb_clean/presentation/home/pages/home.dart';
import 'package:tmdb_clean/service_locator.dart';

class SigninPage extends StatefulWidget {

  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  void _toggleObscured() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Widget _signinText() {
    return const Text(
      'Sign in',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      key: _passwordFieldKey,
      controller: _passwordController,
      obscureText: _isObscure,
      decoration: InputDecoration(
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_rounded : Icons.visibility_off_rounded),
            onPressed: _toggleObscured,
          )),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      onPressed: () async => sl<SigninUseCase>().call(SigninRequrestParams(
          email: _emailController.text, password: _passwordController.text)),
      onSuccess: () async {
        AppNavigation.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) async {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: 'Don\'t have account ? '),
      TextSpan(
          text: 'Sign up',
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigation.push(context, SignupPage());
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
                height: 20,
              ),
              _signinButton(context),
              const SizedBox(
                height: 30,
              ),
              _signupText(context)
            ],
          )),
    );
  }
}
