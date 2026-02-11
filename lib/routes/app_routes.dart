import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/access_help_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/player/presentation/screens/player_home_scaffold.dart';
import '../features/staff/presentation/screens/staff_home_scaffold.dart';
import '../features/staff/presentation/screens/staff_technical_dashboard.dart';
import '../features/owner/presentation/screens/owner_home_scaffold.dart';
import '../features/owner/presentation/screens/owner_profile_screen.dart';
import '../features/owner/presentation/screens/create_club_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String accessHelp = '/access_help';
  
  static const String playerHome = '/player_home';
  
  static const String staffHome = '/staff_home';
  static const String staffTechnicalDashboard = '/staff_technical_dashboard';
  
  static const String ownerHome = '/owner_home';
  static const String ownerProfile = '/owner_profile';
  static const String createClub = '/create_club';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        accessHelp: (context) => const AccessHelpScreen(),
        
        playerHome: (context) => const PlayerHomeScaffold(),
        
        staffHome: (context) => const StaffHomeScaffold(),
        staffTechnicalDashboard: (context) => const StaffTechnicalDashboard(),
        
        ownerHome: (context) => const OwnerHomeScaffold(),
        ownerProfile: (context) => const OwnerProfileScreen(),
        createClub: (context) => const Scaffold(body: CreateClubView()), // Wrapped in Scaffold usually or if View handles it
      };
}
