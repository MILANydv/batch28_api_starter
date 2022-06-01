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
        '/dashboard': (context) => const DashboardScreen(),
      },
    ),
  );
}
