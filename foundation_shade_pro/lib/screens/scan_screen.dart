import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/widgets/glamorous_background.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlamorousBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(Icons.camera_alt, color: Color(0xFF7B1FA2), size: 26),
              SizedBox(width: 8),
              Text(
                'Step 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B1FA2),
                  fontFamily: 'Georgia',
                  letterSpacing: 1.1,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.white,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera, color: Color(0xFF7B1FA2), size: 22),
                    SizedBox(width: 8),
                    Text(
                      'Face Scan',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B1FA2),
                        fontFamily: 'Georgia',
                        letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            blurRadius: 1,
                            color: Colors.white,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Position your face within the frame and rotate 360° to capture your skin tone from all angles',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF7B1FA2),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        blurRadius: 1,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.15),
                          blurRadius: 24,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/test_users/dummy_photo_sumith.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      backgroundColor: const Color(0xFFB39DDB),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontFamily: 'Georgia',
                      ),
                    ),
                    onPressed: () => context.go('/analysis'),
                    child: const Text('Capture & Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
