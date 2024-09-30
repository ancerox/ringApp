import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringapp/core/themes/theme_data.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_2.dart';
import 'package:ringapp/features/ring/presentation/screens/ring_screen.dart';

class StayActiveScreen extends StatefulWidget {
  const StayActiveScreen({super.key});

  @override
  _StayActiveScreenState createState() => _StayActiveScreenState();
}

class _StayActiveScreenState extends State<StayActiveScreen> {
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
                      "Stay active", // Your centered text
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
                    // Navigator.pushNamed(context, '/drink_water');
                  },
                  child: CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/notification_bell.svg',
                      height: 25,
                    ),
                    text: 'Enable reminder to stay active',
                    childWidget: CupertinoSwitch(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/globe.svg',
                      height: 25,
                    ),
                    text: 'Timezone',
                    childWidget: Container(
                      child: const Row(
                        children: [
                          Text(
                            'UTC -6',
                            style: TextStyle(
                              color: Color(0xff7A949D),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/clock.svg',
                      height: 25,
                    ),
                    text: 'Frequency',
                    childWidget: Container(
                      child: const Row(
                        children: [
                          Text(
                            'Weekly',
                            style: TextStyle(
                              color: Color(0xff7A949D),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/clock.svg',
                      height: 25,
                    ),
                    text: 'Day of the week',
                    childWidget: Container(
                      child: const Row(
                        children: [
                          Text(
                            'Monday',
                            style: TextStyle(
                              color: Color(0xff7A949D),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/clock.svg',
                      height: 25,
                    ),
                    text: 'Time',
                    childWidget: Container(
                      child: const Row(
                        children: [
                          Text(
                            '7:30 AM',
                            style: TextStyle(
                              color: Color(0xff7A949D),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )),

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
