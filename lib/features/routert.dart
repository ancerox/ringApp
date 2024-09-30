import 'package:flutter/material.dart';
import 'package:ringapp/features/blood_history.dart';
import 'package:ringapp/features/blood_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/blood':
        return MaterialPageRoute(
          builder: (_) => const BloodScreen(),
        );
      case '/blood_history':
        return MaterialPageRoute(
          builder: (_) => const BloodHistoryScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
