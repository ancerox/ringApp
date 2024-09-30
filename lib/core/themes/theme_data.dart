import 'package:flutter/material.dart';

class CustomTheme {
  // Define the overall theme data
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xff111111), // Background color
      appBarTheme: const AppBarTheme(
        color: Colors.transparent, // Transparent to show gradient
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: headingStyle,
        labelLarge: buttonTextStyle,
      ),
    );
  }

  // Define the linear gradient
  static LinearGradient get linearGradient {
    return const LinearGradient(
      colors: [
        Color(0xFF111111), // Dark black
        Color(0xFF000000), // Black
        Color(0xFF00FFEC), // Bright cyan
        Color(0xFF78F123), // Bright green
        Color(0xFFFFFFFF), // White
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  // Define the radial gradient for background
  static RadialGradient get radialGradient {
    return const RadialGradient(
      center: Alignment.center,
      radius: 1.0,
      colors: [
        Color.fromARGB(255, 9, 66, 65), // Central color
        Color(0xFF111111), // Dark color towards the edges
      ],
      stops: [0.1, 1],
    );
  }

  // Define text styles
  static const TextStyle headingStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    color: Colors.white,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  // Define button decoration with gradient
  static BoxDecoration get buttonDecoration {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color(0xff458B14).withOpacity(0.4), // Glow color
          spreadRadius: 10,
          blurRadius: 20,
          offset: const Offset(0, 9),
        ),
      ],
      color: Colors.greenAccent,
      borderRadius: BorderRadius.circular(30),
      gradient: const LinearGradient(
        colors: [
          Color(0xff458B14), // Darker green at 0%
          Color(0xff78F123), // Bright green at 51%
          Color(0xff458B14), // Darker green at 95%
        ],
        stops: [0.0, 0.51, 0.95],
      ),
    );
  }

  // Box shadow for the green glow behind the ring
  static BoxShadow get ringGlow {
    return BoxShadow(
      color: const Color(0xff78F123).withOpacity(0.5), // Green glow
      spreadRadius: 10,
      blurRadius: 50,
      offset: const Offset(0, 0),
    );
  }

  // Button style for OutlinedButton with the defined text style and border
  static ButtonStyle get outlinedButtonStyle {
    return OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.white),
      shape: buttonShape, // Using the buttonShape getter here
      textStyle: buttonTextStyle,
    );
  }

  // Button border style
  static BorderSide get buttonBorderSide {
    return const BorderSide(color: Colors.white);
  }

  // Define the button shape used across the app
  static RoundedRectangleBorder get buttonShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }

  // Icon color
  static const Color iconColor = Colors.white;
}
