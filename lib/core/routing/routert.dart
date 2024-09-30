import 'package:flutter/material.dart';
import 'package:ringapp/features/heart/presentation/screens/blood_history.dart';
import 'package:ringapp/features/heart/presentation/screens/blood_screen.dart';
import 'package:ringapp/features/heart/presentation/screens/heart_history.dart';
import 'package:ringapp/features/home/presentation/screens/home_page.dart';
import 'package:ringapp/features/notifications/presentation/notifications_screen.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_2.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_3.dart';
import 'package:ringapp/features/ring/presentation/screens/do_not_disturb_screen.dart';
import 'package:ringapp/features/ring/presentation/screens/drink_water_screen.dart';
import 'package:ringapp/features/ring/presentation/screens/reminder_screen.dart';
import 'package:ringapp/features/ring/presentation/screens/stay_active_screen.dart';
import 'package:ringapp/main.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/main':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/blood':
        return MaterialPageRoute(
          builder: (_) => const BloodScreen(),
        );
      case '/blood_history':
        return MaterialPageRoute(
          builder: (_) => const BloodHistoryScreen(),
        );
      case '/heart_history':
        return MaterialPageRoute(
          builder: (_) => const HeartHistoryScreen(),
        );
      case '/do_not_disturbe':
        return MaterialPageRoute(
          builder: (_) => const DoNotDisturbeScreen(),
        );
      case '/reminder':
        return MaterialPageRoute(
          builder: (_) => const ReminderScreen(),
        );
      case '/drink_water':
        return MaterialPageRoute(
          builder: (_) => const DrinkWaterScreen(),
        );
      case '/stay_active':
        return MaterialPageRoute(
          builder: (_) => const StayActiveScreen(),
        );
      case '/notifications':
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      case '/onboarding_2':
        return MaterialPageRoute(
          builder: (_) => const SmartRingSearchPage(),
        );
      case '/onboarding_3':
        return MaterialPageRoute(
          builder: (_) => const OnBoarding3(),
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
