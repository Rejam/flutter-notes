import 'dart:developer' as devtools show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum MenuAction {
  logout,
}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: [
            PopupMenuButton<MenuAction>(
              itemBuilder: (context) {
                const logout = PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text("Logout"),
                );

                return [logout];
              },
              onSelected: (value) async {
                devtools.log(value.toString());
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogoutDialog(context);
                    devtools.log("shouldLogout: $shouldLogout");
                    if (shouldLogout) FirebaseAuth.instance.signOut();
                }
              },
            )
          ],
        ),
        body: const Text('Welcome to My Notes'));
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Sign out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel")),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Sign out")),
          ],
        );
      }).then((value) => value ?? false);
}
