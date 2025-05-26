import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadarLoading extends StatefulWidget {
  const RadarLoading({super.key});

  @override
  State<RadarLoading> createState() => _RadarLoadingState();
}

class _RadarLoadingState extends State<RadarLoading>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circles
          ...List.generate(3, (index) {
            return AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Container(
                  width: 100 - (index * 20),
                  height: 100 - (index * 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(
                        0xFF7B1FA2,
                      ).withOpacity(0.3 - (index * 0.1)),
                      width: 2,
                    ),
                  ),
                );
              },
            );
          }),

          // Scanning beam
          AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * math.pi,
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: RadarBeamPainter(
                    color: const Color(0xFF7B1FA2),
                    progress: _pulseAnimation.value,
                  ),
                ),
              );
            },
          ),

          // Center icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7B1FA2).withOpacity(0.1),
              border: Border.all(color: const Color(0xFF7B1FA2), width: 2),
            ),
            child: const Icon(
              Icons.analytics,
              color: Color(0xFF7B1FA2),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class RadarBeamPainter extends CustomPainter {
  final Color color;
  final double progress;

  RadarBeamPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color.withOpacity(0.3)
          ..style = PaintingStyle.fill;

    final path =
        Path()
          ..moveTo(size.width / 2, size.height / 2)
          ..arcTo(
            Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: size.width / 2,
            ),
            -math.pi / 4,
            math.pi / 2,
            false,
          )
          ..lineTo(size.width / 2, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RadarBeamPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
