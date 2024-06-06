import 'package:flutter/material.dart';
import 'package:testing/screens/cart_screen.dart';
import 'package:testing/screens/forget_password_screen.dart';
import 'package:testing/screens/home_screen.dart';
import 'package:testing/screens/login_screen.dart';
import 'package:testing/screens/profile_screen.dart';
import 'package:testing/screens/registered_screen.dart';

// class AMShopApp extends StatelessWidget {
//   const AMShopApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

class AMShopApp extends StatelessWidget {
  const AMShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LogInScreen(),
        'registered_screen': (context) => RegisteredScreen(),
        'profile_screen': (context) => ProfileScreen(),
        'forget_password_screen': (context) => ForgetPasswordScreen(),
        'home_screen': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
    );
  }
}
