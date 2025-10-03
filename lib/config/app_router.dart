import 'package:flutter/material.dart';
import 'package:tutor_app/presentation/ screens/auth/login_page.dart';
import 'package:tutor_app/presentation/ screens/auth/register_page.dart';
import 'package:tutor_app/presentation/ screens/auth/reset_password_screen.dart';
import 'package:tutor_app/presentation/ screens/home/home_screen.dart';

class AppRouter {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route không tồn tại")),
          ),
        );
    }
  }
}
