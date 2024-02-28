// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/views/login_view.dart';
import 'package:my_notes/views/notes_view.dart';
import 'package:my_notes/views/register_view.dart';
import 'package:my_notes/views/verify_email_view.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.cyan, foregroundColor: Colors.white),
      ),
      home: const LandingPage(),
      routes: {
        Routes.login: (context) => const LoginView(),
        Routes.register: (context) => const RegisterView(),
        Routes.notes: (context) => const NotesView(),
      }));
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              {
                final user = FirebaseAuth.instance.currentUser;
                // FirebaseAuth.instance.signOut();
                if (user == null) {
                  return const LoginView();
                }
                if (user.emailVerified == false) {
                  return const VerifyEmailView();
                }
                return const NotesView();
              }
            default:
              return Center(child: Text(snapshot.connectionState.name));
          }
        });
  }
}
