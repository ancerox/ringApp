import 'dart:ui'; // Required for blur effect

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:ringapp/features/theme_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(), // Añadimos el fondo de gradiente
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Health Ring 3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Transform.rotate(
                              angle:
                                  1.5708, // Rota el ícono 90 grados (en radianes).
                              child: const Icon(
                                Icons.battery_0_bar, // Ícono de batería vacía.
                                color: Color(
                                    0xff78F123), // Cambia el color si lo prefieres.
                                size: 25.0, // Ajusta el tamaño del ícono.
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '80%',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(
                                        0xff78F123), // Glow color and opacity
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
                            const SizedBox(width: 5),
                            Text(
                              'Connected',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/notifications.svg'),
                      onPressed: () {
                        // Acción para el botón de notificaciones
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                    height: 120, width: 350, child: CalendarScreen()),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      'Health Metrics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetricCard(
                        widget: SizedBox(
                          height: 80,
                          child: BarChart(
                            BarChartData(
                              barGroups: _getBarGroups(),
                              borderData: FlBorderData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              gridData: const FlGridData(show: false),
                              barTouchData: BarTouchData(enabled: false),
                            ),
                          ),
                        ),
                        title: 'Health Score',
                        value: '63.3',
                        unit: 'Pts'),
                    _buildMetricCard(
                      unit: 'Bpm',
                      widget: Center(
                        child: SvgPicture.asset(
                          'assets/svg/heart_signals.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: 'Heart Rate',
                      value: '86',
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFF24E1E).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color(0xFFF24E1E),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetricCard(
                      widget: SizedBox(
                        height: 95,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                right: 20,
                                bottom: 25,
                                child: SvgPicture.asset(
                                  'assets/svg/miniline.svg', // Reemplaza con tu primer asset SVG
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/svg/egg.svg', // Reemplaza con tu segundo asset SVG
                                width: 120.0,
                                height: 120.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: 'Blood Pressure',
                      value: '121',
                      unit: 'mmHg',
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00FFEC).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.water_drop,
                          color: Color(0xFF00FFEC),
                          size: 24.0,
                        ),
                      ),
                    ),
                    _buildMetricCard(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF78F123).withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.water_drop,
                          color: Color(0xFF78F123),
                          size: 24.0,
                        ),
                      ),
                      unit: 'Bpm',
                      widget: SizedBox(
                        height: 95,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Center(
                              child: Positioned(
                                // right: 0,
                                bottom: 5,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/svg/circle_green.svg', // Reemplaza con tu primer asset SVG
                                    width: 90.0,
                                    height: 90.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 40,
                              child: SvgPicture.asset(
                                'assets/svg/mini_circle.svg', // Reemplaza con tu segundo asset SVG
                                width: 30.0,
                                height: 30.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      title: 'Heart Rate',
                      value: '121',
                      // icon:
                      // icon: Icon(Icons.drop)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear las tarjetas de métricas con efecto de transparencia y desenfoque
  Widget _buildMetricCard({
    Widget? icon,
    required Widget widget, // Now accepts a widget instead of just an icon
    required String title,
    required String value,
    required String unit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust blur effect
        child: Container(
          width: 190,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xffFFFFFF).withOpacity(0.3),
                  const Color(0xffFFFFFF).withOpacity(0.6),
                ]),
            color: Colors.white.withOpacity(0.03), // Semi-transparent white
            borderRadius: BorderRadius.circular(20),
            border: const Border(
              left: BorderSide(color: Colors.white, width: 0.8),
              right: BorderSide(color: Colors.white, width: 0.8),
              top: BorderSide(color: Colors.white, width: 0.8),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0fffffff),
                blurRadius: 5, // Soften the shadow
                spreadRadius: 5, // Extend the shadow
                offset: Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              widget,
              const SizedBox(height: 10),
              Text(title,
                  style: CustomTheme.headingStyle.copyWith(fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$value ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(unit,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  const Spacer(),
                  icon ?? Container()
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      _buildBarGroup(0, 1),
      _buildBarGroup(1, 2),
      _buildBarGroup(2, 4),
      _buildBarGroup(3, 8),
      _buildBarGroup(4, 4),
      _buildBarGroup(5, 5.5),
      _buildBarGroup(6, 3),
      _buildBarGroup(7, 2.5),
      _buildBarGroup(7, 5.5),
    ];
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    Color barColor;

    switch (x) {
      case 0:
        barColor = const Color(0xffC7FFA0); // First color
        break;
      case 1:
        barColor = const Color(0xffC7FFA0); // Second color (white)
        break;
      case 2:
        barColor = const Color(0xffB9FF87); // Third color
        break;
      case 3:
        barColor = const Color(0xffA0FF5D); // Fourth color
        break;
      case 4:
        barColor = const Color(0xff8EE352); // Fifth color
        break;
      case 5:
        barColor = const Color(0xffA0FF5D); // Sixth color
        break;
      default:
        barColor = const Color(0xffC7FFA0); // Default color if x exceeds
    }

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 15,
          borderRadius: BorderRadius.circular(4),
          color: barColor,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 8,
            color: Colors.transparent, // Make the background fully transparent
          ),
        ),
      ],
    );
  }
}

// Fondo con gradiente y desenfoque
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
                Color.fromARGB(255, 9, 66, 65), // Cian brillante
                Color(0xFF131512),
                Color(0xFF111111), // Negro oscuro
              ],
            ),
          ),
        ),
        // Aplicar el efecto de desenfoque
        BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Efecto de desenfoque
          child: Container(
            color: Colors.black.withOpacity(0.1), // Capa semi-transparente
          ),
        ),
      ],
    );
  }
}

class CustomCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    // Big circle
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Small circle
    canvas.drawCircle(
        Offset(size.width * 0.75, size.height / 2), size.width * 0.2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300, // Adjust the size as needed
        height: 300,
        child: CustomPaint(
          painter: CustomCirclePainter(),
        ),
      ),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('E');
  int _selectedIndex = 0; // To keep track of the selected index

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xffFFFFFF).withOpacity(0.1),
              const Color(0xffFFFFFF).withOpacity(0.7),
            ]),
        color: Colors.white.withOpacity(0.15), // Semi-transparent white
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          left: BorderSide(color: Colors.white, width: 0.8),
          right: BorderSide(color: Colors.white, width: 0.8),
          top: BorderSide(color: Colors.white, width: 0.8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 7,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  'Jun',
                  style:
                      CustomTheme.buttonTextStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                Transform.rotate(
                  angle:
                      -1.5708, // This is approximately π/2 radians (90 degrees)
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff7A949D),
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              DateTime day = now.add(Duration(days: index));
              bool isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index; // Update the selected index
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSelected)
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Color(0xff78F123), // Glow color and opacity
                              blurRadius: 8.0, // Intensity of the glow
                              spreadRadius: 1.0, // Spread of the glow
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.circle,
                          color: Color(0xff78F123), // Original icon color
                          size: 7, // Icon size
                        ),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 35,
                      height: 60,
                      // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff556972),
                                Color(0xffACC5CF),
                              ]),
                          color: isSelected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(11)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(formatter.format(day)[0],
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : const Color(0xff7A949D),
                                  fontSize: 15)), // First letter of the day
                          const SizedBox(
                            height: 13,
                          ),
                          Text(day.day.toString(),
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
