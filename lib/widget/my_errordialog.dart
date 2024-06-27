import 'package:flutter/material.dart';

void displayErrorMessage(String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}
