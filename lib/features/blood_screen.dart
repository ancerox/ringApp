import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringapp/features/onboarding_2.dart';
import 'package:ringapp/features/theme_data.dart';

class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});

  @override
  _BloodScreenState createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _systolicAnimation;
  late Animation<double> _diastolicAnimation;
  late Animation<double> _progressAnimation;
  bool isReadingStarted = false;

  @override
  void initState() {
    super.initState();

    // Initialize the controller and animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Same duration for all animations
    );

    // Blood pressure animations
    _systolicAnimation = Tween<double>(begin: 0, end: 121).animate(_controller);
    _diastolicAnimation = Tween<double>(begin: 0, end: 79).animate(_controller);

    // Progress animation (used for the glowing progress)
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startReading() {
    if (!isReadingStarted) {
      setState(() {
        isReadingStarted = true;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Blood analysis",
                      style: CustomTheme.headingStyle.copyWith(fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/blood_history');
                        },
                        icon: SvgPicture.asset('assets/svg/chart.svg'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SvgPicture.asset(
                        'assets/svg/beat.svg',
                        height: 50,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Text(
                          "${_systolicAnimation.value.toInt()}/${_diastolicAnimation.value.toInt()}",
                          style: CustomTheme.headingStyle.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  "Elevated. Be Careful!",
                  style: CustomTheme.headingStyle.copyWith(
                    color: const Color(0xffFFFFFF).withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
                CircularProgressWidget(
                  totalTime: 5, // Match duration of blood pressure animation
                  progressAnimation: _progressAnimation,
                ),
                const SizedBox(height: 60),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDecoratedWidget(
                      iconColor: Color(0xffF24E1E),
                      firstRowText: "121",
                      icon: Icons.favorite,
                      secondRowText: "spO2",
                      titleText: "Oxygen",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomDecoratedWidget(
                      iconColor: Color(0xff78F123),
                      firstRowText: "50",
                      icon: Icons.bloodtype,
                      secondRowText: "mg",
                      titleText: "Cholesterol",
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                DragButtonScreen(
                  onDragComplete: startReading,
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressWidget extends StatefulWidget {
  final double totalTime;
  final Animation<double> progressAnimation;

  const CircularProgressWidget({
    super.key,
    required this.totalTime,
    required this.progressAnimation,
  });

  @override
  _CircularProgressWidgetState createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with SingleTickerProviderStateMixin {
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.totalTime.toInt();

    // Update seconds remaining as the animation progresses
    widget.progressAnimation.addListener(() {
      setState(() {
        _secondsRemaining =
            (widget.totalTime * (1 - widget.progressAnimation.value)).round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.progressAnimation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(220, 220),
              painter: CirclePainter(),
            ),
            CustomPaint(
              size: const Size(220, 220),
              painter: GlowingProgressPainter(
                widget.progressAnimation.value,
                15,
              ),
            ),
            CustomPaint(
              size: const Size(220, 220),
              painter: EndCirclePainter(
                widget.progressAnimation.value,
                15,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Reading...",
                    style: CustomTheme.buttonTextStyle
                        .copyWith(color: const Color(0xff78F123))),
                Text(
                  "$_secondsRemaining seconds",
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class DragButtonScreen extends StatefulWidget {
  final VoidCallback onDragComplete;

  const DragButtonScreen({super.key, required this.onDragComplete});

  @override
  _DragButtonScreenState createState() => _DragButtonScreenState();
}

class _DragButtonScreenState extends State<DragButtonScreen>
    with SingleTickerProviderStateMixin {
  bool isDragged = false;
  double _buttonPosition = 0;
  final double _maxPosition = 240;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              gradient: isDragged
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          const Color(0xff78F123).withOpacity(0.7),
                          const Color(0xff78F123),
                        ])
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          const Color(0xffFFFFFF).withOpacity(0.1),
                          const Color(0xffFFFFFF).withOpacity(0.7),
                        ]),
              color: isDragged ? null : Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: const Border(
                left: BorderSide(color: Colors.white, width: 0.8),
                right: BorderSide(color: Colors.white, width: 0.8),
                top: BorderSide(color: Colors.white, width: 0.8),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: isDragged
                ? const Text(
                    "Do not move or talk",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                : const Center(
                    child: Text(
                      "            Swipe to start reading...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: _buttonPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _buttonPosition += details.delta.dx;
                  if (_buttonPosition < 0) {
                    _buttonPosition = 0;
                  } else if (_buttonPosition > _maxPosition) {
                    _buttonPosition = _maxPosition;
                  }
                });
              },
              onHorizontalDragEnd: (details) {
                if (_buttonPosition > _maxPosition * 0.7) {
                  setState(() {
                    isDragged = true;
                  });
                  widget.onDragComplete();
                } else {
                  _controller.reset();
                  _controller.forward();
                  _controller.addListener(() {
                    setState(() {
                      _buttonPosition =
                          _buttonPosition * (1 - _controller.value);
                      // isDragged = false;
                    });
                  });
                }
              },
              child: isDragged ? Container() : _buildDragButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDragButton() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF78F123),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class GlowingProgressPainter extends CustomPainter {
  final double progress;
  final double glowIntensity;

  GlowingProgressPainter(this.progress, this.glowIntensity);

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint glowPaint = Paint()
      ..color = const Color(0xff78F123)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4); // Static glow

    Paint solidPaint = Paint()
      ..color = const Color(0xff78F123)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    // Draw the glowing arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start angle
      2 * pi * progress, // Sweep angle based on progress
      false,
      glowPaint,
    );

    // Draw the solid arc on top
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      solidPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class EndCirclePainter extends CustomPainter {
  final double progress;
  final double glowIntensity;

  EndCirclePainter(this.progress, this.glowIntensity);

  @override
  void paint(Canvas canvas, Size size) {
    double angle = 2 * pi * progress;
    double radius = min(size.width / 2, size.height / 2);
    double strokeWidth = 25;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset circlePosition = Offset(
      center.dx + radius * cos(angle - pi / 2),
      center.dy + radius * sin(angle - pi / 2),
    );

    Paint glowPaint = Paint()
      ..color = const Color(0xff78F123)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowIntensity);

    Paint circlePaint = Paint()
      ..color = const Color(0xff78F123)
      ..style = PaintingStyle.fill;

    // Draw the glowing circle
    canvas.drawCircle(circlePosition, strokeWidth / 1.5, glowPaint);
    // Draw the solid circle
    canvas.drawCircle(circlePosition, strokeWidth / 2, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff263937)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // Draw the grey background circle
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomDecoratedWidget extends StatelessWidget {
  final String titleText;
  final IconData icon;
  final String firstRowText;
  final String secondRowText;
  final Color iconColor;

  const CustomDecoratedWidget({
    super.key,
    required this.titleText,
    required this.icon,
    required this.firstRowText,
    required this.secondRowText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xffFFFFFF).withOpacity(0.3),
            const Color(0xffFFFFFF).withOpacity(0.6),
          ],
        ),
        color: Colors.white.withOpacity(0.22),
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          left: BorderSide(color: Colors.white, width: 0.8),
          right: BorderSide(color: Colors.white, width: 0.8),
          top: BorderSide(color: Colors.white, width: 0.8),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customizable Title Text
          Text(titleText,
              style: CustomTheme.buttonTextStyle
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
          const SizedBox(height: 10), // Spacing between text and row
          // Row with Customizable Icon and Texts
          Row(
            children: [
              // Icon with glow effect
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: iconColor.withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 8),
              Text(
                firstRowText,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                secondRowText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
