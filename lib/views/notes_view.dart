import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/components/appbar_actions.dart';

enum MenuAction {
  logout,
}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: appBarActions(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Welcome ${user?.email}'),
        ));
  }
}
