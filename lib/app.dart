import 'package:flutter/material.dart';
import 'package:testing/screens/forget_password_screen.dart';
import 'package:testing/screens/home_screen.dart';
import 'package:testing/screens/login_screen.dart';
import 'package:testing/screens/profile_screen.dart';
import 'package:testing/screens/registered_screen.dart';

class AMShopApp extends StatelessWidget {
  const AMShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LogInScreen(),
        'registered_screen': (context) => const RegisteredScreen(),
        'profile_screen': (context) => const ProfileScreen(),
        'forget_password_screen': (context) => const ForgetPasswordScreen(),
        'home_screen': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
