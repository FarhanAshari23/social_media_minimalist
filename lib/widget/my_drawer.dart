import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/widget/my_listtile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.book,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              MyListTile(
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
                text: 'Home',
              ),
              MyListTile(
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
                text: 'Profile',
              ),
              MyListTile(
                icon: Icons.person_search,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/users');
                },
                text: 'Users',
              ),
              MyListTile(
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
                text: 'Settings',
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MyListTile(
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                logout();
              },
              text: 'Logout',
            ),
          )
        ],
      ),
    );
  }
}
