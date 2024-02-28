import 'dart:developer' as devtools show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/components/logout_dialog.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/main.dart';

enum MenuAction { logout }

List<Widget> appBarActions(BuildContext context) {
  return [
    PopupMenuButton<MenuAction>(
      itemBuilder: (context) {
        const logout = PopupMenuItem<MenuAction>(
          value: MenuAction.logout,
          child: Text("Logout"),
        );
        return [logout];
      },
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            {
              final confirmedLogout = await logoutDialog(context);
              devtools.log("to logout: $confirmedLogout");
              if (confirmedLogout && context.mounted) {
                handleLogout(context);
              }
            }
        }
      },
    )
  ];
}

void handleLogout(context) {
  try {
    FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  } catch (e) {
    devtools.log("Unable to log out: ${e.toString()}");
  }
}
