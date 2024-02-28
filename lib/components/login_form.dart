import 'dart:developer' as devtools show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController(text: "ryan.james@ne6.studio");
    _password = TextEditingController(text: "password");
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: "Email Address"),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: "Password"),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;

            try {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password);
              if (context.mounted) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/notes', (route) => false);
              }
            } on FirebaseAuthException catch (e) {
              final message = handleFirebaseAuthError(e);
              devtools.log(message);
            } catch (e) {
              devtools.log("unexpected login error: ${e.toString()}");
            }
          },
          child: const Text("Log in"),
        ),
      ],
    );
  }
}

String handleFirebaseAuthError(FirebaseAuthException e) {
  final code = e.code;
  switch (code) {
    case 'invalid-credential':
      return "Please check your credentials";
    default:
      return "Login error: $code";
  }
}
