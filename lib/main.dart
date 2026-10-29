import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:flutter_application_1/features/app_section/screens/app_section.dart';
import 'package:flutter_application_1/features/auth/presentation/view/screens/login_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/view/screens/register_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.registration,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.registration: (context) => RegisterScreen(),
        AppRoutes.appSection: (context) => AppSection(),
      },
    );
  }
}
