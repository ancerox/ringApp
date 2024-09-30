import 'package:flutter/material.dart';
import 'package:ringapp/core/routing/routert.dart';
import 'package:ringapp/core/themes/theme_data.dart';
import 'package:ringapp/features/heart/presentation/screens/blood_history.dart';
import 'package:ringapp/features/heart/presentation/screens/blood_screen.dart';
import 'package:ringapp/features/heart/presentation/screens/heart_analysis_screen.dart';
import 'package:ringapp/features/home/presentation/screens/home_page.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_1.dart';
import 'package:ringapp/features/ring/presentation/screens/ring_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.themeData,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const OnBoarding1(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Manage the current index for BottomNavigationBar
  int _currentIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    const HomePage(),
    const HeartScreen(),
    const BloodScreen(),
    const RingScreen()
  ];

  // List of screens where BottomNavigationBar should not be shown
  final List<int> _hideBottomNavBarOnScreens =
      []; // Example: hide on BloodScreen (index 2)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          if (!_hideBottomNavBarOnScreens.contains(_currentIndex))
            Positioned(
              left: 0,
              right: 0,
              bottom:
                  20, // Adjust the bottom position to give a floating effect
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.03),
                        Colors.white.withOpacity(0.10),
                      ],
                      stops: const [0, 100],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomPaint(
                    painter: GradientPainter(padding: -20, widthPadding: -10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.house_siding_outlined, 'Home', 0),
                        _buildNavItem(Icons.favorite_border, 'Heart', 1),
                        _buildNavItem(Icons.bloodtype_outlined, 'Blood', 2),
                        _buildNavItem(Icons.circle_outlined, 'My ring', 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to build each item
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? Colors.green : Colors.white,
            size: 22,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
