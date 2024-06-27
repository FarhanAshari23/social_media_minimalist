import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth.dart';
import 'package:social_media_app/auth/login_or_register.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/pages/home.dart';
import 'package:social_media_app/pages/profile.dart';
import 'package:social_media_app/pages/settings.dart';
import 'package:social_media_app/pages/users.dart';
import 'package:social_media_app/theme/dark.dart';
import 'package:social_media_app/theme/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightmode,
      darkTheme: darkmode,
      routes: {
        '/login_or_register': (context) => const LoginOrRegister(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/users': (context) => const UsersPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
