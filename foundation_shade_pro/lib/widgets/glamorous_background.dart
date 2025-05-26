import 'dart:math';
import 'package:flutter/material.dart';

class GlamorousBackground extends StatelessWidget {
  final Widget child;
  const GlamorousBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Softer, elegant gradient background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8EAF6), // very light lavender
                Color(0xFFEDE7F6), // soft lavender
                Color(0xFFFDEFEF), // soft pink
                Color(0xFFFDF6E3), // soft gold/cream
              ],
            ),
          ),
        ),
        // Subtle glitter overlay (fewer sparkles)
        const Positioned.fill(child: _GlitterOverlay()),
        // Main content
        child,
      ],
    );
  }
}

class _GlitterOverlay extends StatelessWidget {
  const _GlitterOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(child: CustomPaint(painter: _GlitterPainter()));
  }
}

class _GlitterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(2024);
    for (int i = 0; i < 40; i++) {
      // fewer sparkles
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.2 + 0.5;
      final paint =
          Paint()
            ..color = Colors.white.withOpacity(
              random.nextDouble() * 0.18 + 0.08,
            )
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.2);
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
