import 'dart:ui'; // Required for the blur effect

import 'package:flutter/material.dart';
import 'package:ringapp/features/theme_data.dart'; // Assuming this is your theme file

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(), // Background with blur effect
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Green glow behind the ring
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 1,
                        bottom: 1,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            boxShadow: [CustomTheme.ringGlow],
                          ),
                        ),
                      ),
                      const Image(
                        image: AssetImage(
                          'assets/png/ring.png',
                        ),
                        width: 163,
                        height: 187,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "Let's begin by pairing\nyour Smart Ring",
                  textAlign: TextAlign.center,
                  style: CustomTheme.headingStyle,
                ),
                const SizedBox(height: 60),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: Container(
                        decoration: CustomTheme.buttonDecoration,
                        alignment: Alignment.center,
                        child: Text(
                          'Begin',
                          style: CustomTheme.buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: CustomTheme.radialGradient, // Background gradient
          ),
        ),
        // Applying the blur effect using BackdropFilter
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur strength
          child: Container(
            color: Colors.black.withOpacity(0.1), // Semi-transparent overlay
          ),
        ),
      ],
    );
  }
}
