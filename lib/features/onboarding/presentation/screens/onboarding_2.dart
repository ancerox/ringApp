import 'dart:async';
import 'dart:ui'; // Required for the blur effect

import 'package:flutter/material.dart';
import 'package:ringapp/core/themes/theme_data.dart';

class RingWaveAnimation extends StatefulWidget {
  const RingWaveAnimation({super.key});

  @override
  _RingWaveAnimationState createState() => _RingWaveAnimationState();
}

class _RingWaveAnimationState extends State<RingWaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  double _currentRadius = 50;

  @override
  void initState() {
    super.initState();

    // Adjusted the duration for faster, smoother animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Faster animation speed
    )..repeat(reverse: false);

    // Updating the timer to run more frequently for smoothness
    _timer = Timer.periodic(const Duration(milliseconds: 16), (Timer timer) {
      // 16 milliseconds corresponds to roughly 60 frames per second (aiming for smooth motion)
      setState(() {
        _currentRadius +=
            2; // Slower, controlled increase for smoother animation
        if (_currentRadius > 200) {
          _currentRadius = 50; // Reset when it gets too large
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: RingWavePainter(_currentRadius),
          child: const SizedBox(width: 200, height: 200),
        );
      },
    );
  }
}

class RingWavePainter extends CustomPainter {
  final double radius;
  RingWavePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw multiple concentric circles with increasing radius
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        radius * i, // Increment the radius for each circle
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmartRingSearchPage extends StatelessWidget {
  const SmartRingSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(), // Background with blur effect
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.bluetooth,
                  color: CustomTheme.iconColor.withOpacity(0.8),
                  size: 50,
                ),
                Text("Searching for your Smart Ring...",
                    textAlign: TextAlign.center,
                    style: CustomTheme.headingStyle.copyWith(fontSize: 17)),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 40,
                      bottom: 30,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          boxShadow: [CustomTheme.ringGlow],
                        ),
                      ),
                    ),
                    // Adding ring glow effect behind the image
                    const Positioned(
                      child: SizedBox(
                        width: 163,
                        height: 163,
                        child: RingWaveAnimation(), // Radiating wave animation
                      ),
                    ),
                    // Ring image on top
                    const Image(
                      image: AssetImage('assets/png/ring.png'),
                      width: 85,
                      height: 95,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      // Button to handle connection issues
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/onboarding_3');
                        },
                        style: OutlinedButton.styleFrom(
                            side: CustomTheme.buttonBorderSide,
                            shape: CustomTheme.buttonShape,
                            minimumSize: const Size(240, 50)),
                        child: Text(
                          'Trouble connecting?',
                          style: CustomTheme.buttonTextStyle
                              .copyWith(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF102624), // Verde oscuro
                Color.fromARGB(255, 8, 56, 55), // Cian brillante
                Color(0xFF111111), // Negro oscuro
                Color(0xFF131512),
              ],
            ),
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
