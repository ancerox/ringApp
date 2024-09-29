import 'package:flutter/material.dart';
import 'package:ringapp/features/blood_screen.dart';
import 'package:ringapp/features/theme_data.dart';

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
      home: const MainScreen(),
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
    const BloodScreen(),
  ];

  // List of screens where BottomNavigationBar should not be shown
  final List<int> _hideBottomNavBarOnScreens = [
    2
  ]; // Example: hide on BloodScreen (index 2)

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
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xffFFFFFF).withOpacity(0.3),
                        const Color(0xffFFFFFF).withOpacity(0.6),
                      ],
                    ),
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                    border: const Border(
                      left: BorderSide(color: Colors.white, width: 0.8),
                      right: BorderSide(color: Colors.white, width: 0.8),
                      top: BorderSide(color: Colors.white, width: 0.8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
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
