import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onTap: onTap,
      ),
    );
  }
}
