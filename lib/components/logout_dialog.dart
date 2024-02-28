import 'package:flutter/material.dart';

Future<bool> logoutDialog(BuildContext context) {
  return showDialog<bool>(context: context, builder: logoutDialogBuilder)
      // Must return boolean so return false if it's null value
      .then((value) => value ?? false);
}

Widget logoutDialogBuilder(context) {
  return AlertDialog(
    title: const Text("Sign out"),
    content: const Text("Are you sure you want to sign out?"),
    actions: logoutDialogActions(context),
  );
}

List<Widget> logoutDialogActions(context) {
  final cancel = TextButton(
      onPressed: () => Navigator.of(context).pop(false),
      child: const Text("Cancel"));

  final logout = TextButton(
      onPressed: () => Navigator.of(context).pop(true),
      child: const Text("Sign out"));

  return [cancel, logout];
}
