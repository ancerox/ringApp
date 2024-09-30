import 'package:flutter/material.dart';
import 'package:ringapp/core/themes/theme_data.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: SizedBox(
        width: 250,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Container(
            decoration: CustomTheme.buttonDecoration
                .copyWith(borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Text(
              text,
              style: CustomTheme.buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

// Fondo con gradiente
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
            Color(0xFF102624),
            Color(0xFF00FFEC),
            Color(0xFF111111),
            Color(0xFF131512),
          ],
          stops: [0.1, 0.3, 0.6, 1.0],
        ),
      ),
    );
  }
}
