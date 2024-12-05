import 'package:flutter/material.dart';
import 'package:bodymax/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:bodymax/features/scan/presentation/pages/scan_page.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String scan = '/scan';
  static const String profile = '/profile';
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case scan:
        return MaterialPageRoute(builder: (_) => const ScanPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Route ${settings.name} not found')),
          ),
        );
    }
  }
}