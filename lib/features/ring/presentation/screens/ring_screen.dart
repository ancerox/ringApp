import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringapp/core/themes/theme_data.dart';
import 'package:ringapp/features/heart/presentation/screens/blood_history.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_2.dart';

class RingScreen extends StatelessWidget {
  const RingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Ring 3',
                            style: CustomTheme.buttonTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Silver | Size 8',
                            style: CustomTheme.buttonTextStyle.copyWith(
                                color: const Color(0xff7A949D),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svg/battery.svg'),
                    Text(
                      '80%',
                      style: CustomTheme.buttonTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff78F123), // Glow color and opacity
                            blurRadius: 8.0, // Intensity of the glow
                            spreadRadius: 1.0, // Spread of the glow
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.circle,
                        color: Color(0xff78F123), // Original icon color
                        size: 10, // Icon size
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Conneted',
                      style: CustomTheme.buttonTextStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Preferences',
                  style: CustomTheme.buttonTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                  icon: SvgPicture.asset(
                    'assets/svg/notification_bell.svg',
                    height: 25,
                  ),
                  text: 'Notifications',
                  childWidget: CupertinoSwitch(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/do_not_disturbe');
                  },
                  child: CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/moon.svg',
                      height: 25,
                    ),
                    text: 'Do not disturbe',
                    childWidget: CupertinoSwitch(
                      value: false,
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/reminder');
                  },
                  child: CustomGradientContainer(
                      icon: SvgPicture.asset(
                        'assets/svg/alarm.svg',
                        height: 25,
                      ),
                      text: 'Reminders',
                      childWidget: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomGradientContainer(
                    icon: SvgPicture.asset(
                      'assets/svg/disconnect.svg',
                      height: 25,
                    ),
                    text: 'Disconnect',
                    childWidget: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGradientContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget icon;
  final String text;
  final Widget childWidget;

  const CustomGradientContainer({
    super.key,
    this.height = 60.0,
    this.width = 400.0,
    required this.icon,
    required this.text,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
      height: height,
      width: width,
      child: CustomPaint(
        painter: GradientPainter(widthPadding: -20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style:
                    CustomTheme.buttonTextStyle.copyWith(color: Colors.white),
              ),
            ),
            const Spacer(),
            childWidget,
          ],
        ),
      ),
    );
  }
}
