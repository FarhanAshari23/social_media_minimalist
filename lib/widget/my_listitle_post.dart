import 'package:flutter/material.dart';

class ListTilePost extends StatelessWidget {
  final String message;
  final String userEmail;
  const ListTilePost({
    super.key,
    required this.message,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ListTile(
          title: Text(message),
          subtitle: Text(
            userEmail,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
