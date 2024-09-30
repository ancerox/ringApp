import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringapp/core/themes/theme_data.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_2.dart';
import 'package:ringapp/features/ring/presentation/screens/ring_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(), // Assuming this is defined elsewhere
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // iOS-style back arrow
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context); // Navigates back when pressed
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    Text(
                      "Reminder", // Your centered text
                      style: CustomTheme.headingStyle.copyWith(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                // Centered Text above everything
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/drink_water');
                  },
                  child: CustomGradientContainer(
                      icon: SvgPicture.asset(
                        'assets/svg/drop.svg',
                        height: 25,
                      ),
                      text: 'Drink water',
                      childWidget: Container(
                          child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/stay_active');
                  },
                  child: CustomGradientContainer(
                      icon: SvgPicture.asset(
                        'assets/svg/weight.svg',
                        height: 25,
                      ),
                      text: 'Stay active',
                      childWidget: Container(
                          child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Centered container with the gradient and selectable items

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
