import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/player/presentation/screens/player_home_scaffold.dart';
import '../features/staff/presentation/screens/staff_home_scaffold.dart';
import '../features/owner/presentation/screens/owner_home_scaffold.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String playerHome = '/player_home';
  static const String staffHome = '/staff_home';
  static const String ownerHome = '/owner_home';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        playerHome: (context) => const PlayerHomeScaffold(),
        staffHome: (context) => const StaffHomeScaffold(),
        ownerHome: (context) => const OwnerHomeScaffold(),
      };
}
