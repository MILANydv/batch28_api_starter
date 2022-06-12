import 'package:batch28_api_starter/screen/HomeScreen.dart';
import 'package:batch28_api_starter/screen/add_screen.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard.dart';
import 'screen/login.dart';
import 'screen/register.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const HomeScreen(),
        '/add': (context) => const AddProduct(),
      },
    ),
  );
}
