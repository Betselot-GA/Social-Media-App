import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/Pages/home_page.dart';
import 'package:social_media/Pages/profile_page.dart';
import 'package:social_media/Pages/register_page.dart';
import 'package:social_media/Pages/settings_page.dart';
import 'package:social_media/Pages/users_page.dart';
import 'package:social_media/services/auth/auth.dart';
import 'package:social_media/services/auth/auth_gate.dart';
import 'package:social_media/services/auth/login_or_register.dart';
import 'package:social_media/firebase_options.dart';
import 'package:social_media/theme/dark_mode.dart';
import 'package:social_media/theme/light_mode.dart';
import 'package:social_media/theme/theme_provider.dart';
import 'Pages/log_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      
      routes: {
        '/login_register_page': (context) => LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => UsersPage(),
        '/settings_page': (context) => const SettingsPage(),
      },
    );
  }
}
