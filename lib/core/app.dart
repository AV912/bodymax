import 'package:flutter/material.dart';
import 'package:bodymax/core/routes/app_routes.dart';
import 'package:bodymax/core/theme/app_theme.dart';

class BodyMaxApp extends StatelessWidget {
  const BodyMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BodyMax',
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.onboarding,
    );
  }
}