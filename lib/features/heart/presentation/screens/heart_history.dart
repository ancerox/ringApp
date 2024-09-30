import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringapp/core/themes/theme_data.dart';
import 'package:ringapp/features/onboarding/presentation/screens/onboarding_2.dart';

class HeartHistoryScreen extends StatefulWidget {
  const HeartHistoryScreen({super.key});

  @override
  _HeartHistoryScreenState createState() => _HeartHistoryScreenState();
}

class _HeartHistoryScreenState extends State<HeartHistoryScreen> {
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
                      "Heart History", // Your centered text
                      style: CustomTheme.headingStyle.copyWith(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // Centered Text above everything

                const SizedBox(height: 20), // Spacing between text and row
                // Centered container with the gradient and selectable items
                Center(
                  child: Container(
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
                    height: 60,
                    width: 400,
                    child: CustomPaint(
                      painter: GradientPainter(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildSelectableItem(0, 'Today'),
                          buildSelectableItem(1, 'This week'),
                          buildSelectableItem(2, 'This month'),
                          buildSelectableItem(3, 'This year'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    // height: 200,
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
                      painter: GradientPainter(padding: -20),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/large_beat.svg',
                            height: 120,
                            // width: 300,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Color(0xff78F123), // Original icon color
                                size: 5, // Icon size
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' 100',
                                      style: CustomTheme.headingStyle
                                          .copyWith(fontSize: 25),
                                    ),
                                    TextSpan(
                                      text: 'ms',
                                      style: CustomTheme.headingStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.circle,
                                color: Color(0xff78F123), // Original icon color
                                size: 5, // Icon size
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' 67',
                                      style: CustomTheme.headingStyle
                                          .copyWith(fontSize: 25),
                                    ),
                                    TextSpan(
                                      text: 'min',
                                      style: CustomTheme.headingStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.circle,
                                color: Color(0xff78F123), // Original icon color
                                size: 5, // Icon size
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: ' 86',
                                      style: CustomTheme.headingStyle
                                          .copyWith(fontSize: 25),
                                    ),
                                    TextSpan(
                                      text: 'bpm',
                                      style: CustomTheme.headingStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Jan 12, 2024  ',
                                style: CustomTheme.headingStyle.copyWith(
                                    color: const Color(
                                      0xffD6D6D6,
                                    ),
                                    fontSize: 12),
                              ),
                              const Icon(
                                Icons.circle,
                                color: Color(0xffD6D6D6), // Original icon color
                                size: 5, // Icon size
                              ),
                              Text(
                                ' Normal ',
                                style: CustomTheme.headingStyle.copyWith(
                                    color: const Color(
                                      0xffD6D6D6,
                                    ),
                                    fontSize: 12),
                              ),
                              const Icon(
                                Icons.check_box,
                                size: 10,
                                color: Color(0xff78F123),
                              )
                            ],
                          )
                        ],
                      ), // Empty container
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

  Widget buildSelectableItem(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xffA8FF6B).withOpacity(0.82)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                selectedIndex == index ? const Color(0xff245601) : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  final double padding;

  GradientPainter({this.padding = 0}); // Padding as a parameter

  @override
  void paint(Canvas canvas, Size size) {
    // Reduce size by padding to create the padded area
    final double paddedWidth = size.width - padding * 2;
    final double paddedHeight = size.height - padding * 2;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.025) // Black with 25% opacity
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 4); // Blur radius of 4

    // Define the rectangle and rounded rectangle for the shadow
    final startShadow = Offset(padding, padding);
    final endShadow = Offset(paddedWidth + padding, paddedHeight + padding);
    final rectShadow = Rect.fromPoints(startShadow, endShadow);
    final rRectShadow = RRect.fromRectAndRadius(
        rectShadow
            .shift(const Offset(0, 4)), // Offset Y by 4 to create shadow effect
        const Radius.circular(20));

    // Draw the shadow
    canvas.drawRRect(rRectShadow, shadowPaint);

    // Create the gradient for the stroke
    final gradient = LinearGradient(
      colors: [
        Colors.white,
        const Color(0xff111919).withOpacity(0.7),
        const Color(0xff111919),
      ],
      begin: Alignment.centerLeft, // Start at center left
      end: Alignment.centerRight, // End at center right
    );

    final start = Offset(padding, padding);
    final end = Offset(paddedWidth + padding, paddedHeight + padding);
    final rect = Rect.fromPoints(start, end);
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));

    final paint = Paint()
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    // Draw the gradient stroke
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Adjust as needed if you plan to update the drawing
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 15, // Adjust max Y value based on your data
          barTouchData: BarTouchData(enabled: false),
          titlesData: const FlTitlesData(
            show: false, // Hide X and Y axis labels
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            _buildBarGroup(9, 4, 9),
            _buildBarGroup(0, 5, 10),
            _buildBarGroup(1, 8, 12),
            _buildBarGroup(2, 7, 11),
            _buildBarGroup(4, 6, 10),
            _buildBarGroup(5, 3, 8),
            _buildBarGroup(1, 8, 12),
            _buildBarGroup(6, 9, 14),
            _buildBarGroup(7, 2, 7),
          ],
          gridData: const FlGridData(show: false), // Hide the grid lines
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double value1, double value2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value1,
          width: 12, // Set width of each bar
          color: Colors.greenAccent.shade400, // Set bar color
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
        BarChartRodData(
          toY: value2,
          width: 12, // Set width of each bar
          color: Colors.lightGreenAccent.shade400, // Set bar color
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
      ],
    );
  }
}
