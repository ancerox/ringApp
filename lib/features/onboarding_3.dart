import 'package:flutter/material.dart';
import 'package:ringapp/features/custom_button.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  _OnBoarding3State createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true); // Loop animation between big and small

    _animation = Tween<double>(begin: 1.3, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(), // Fondo con gradiente
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.bluetooth_outlined,
                  color: Colors.white.withOpacity(0.8),
                  size: 40,
                ),
                Column(
                  children: [
                    Text("Found your device",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8))),
                    const SizedBox(height: 10),
                    const Text("Health Ring 3",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 5),
                    const Text("Silver | Size 8",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 40),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Animated GIF with gradual size changes
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: child,
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/gifs/ring_png.gif'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    // Botón "Connect" con fondo verde
                    CustomButton(
                      text: "Connect",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    // Botón "This is not my device" con borde blanco
                    OutlinedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withOpacity(0.8)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: const Size(250, 50),
                      ),
                      child: Text(
                        'This is not my device',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reutilizando la clase del fondo con gradiente
class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 9, 66, 65), // Cian brillante
            Color(0xFF102624), // Verde oscuro
            Color(0xFF131512),
            Color(0xFF111111), // Negro oscuro
            Color(0xFF111111), // Negro oscuro
          ],
        ),
      ),
    );
  }
}
