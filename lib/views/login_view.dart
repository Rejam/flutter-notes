import 'package:flutter/material.dart';
import 'package:my_notes/components/login_form.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/main.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          LoginForm(),
          RegisterLink(),
        ]),
      ),
    );
  }
}

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.register, (route) => false);
        },
        child: const Text("Don't have an account? Register"));
  }
}
