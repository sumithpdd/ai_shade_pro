import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/widgets/glamorous_background.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlamorousBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App icon for branding
                Image.asset('assets/icon.png', width: 90, height: 90),
                const SizedBox(height: 16),
                Shimmer.fromColors(
                  baseColor: Colors.purple.shade200,
                  highlightColor: Colors.yellow.shade100,
                  child: const Text(
                    'Foundation Shade Pro',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Find your perfect foundation shade in 3 simple steps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF7B1FA2),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 48),
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
                    onPressed: () => context.go('/scan'),
                    child: const Text('Get Started'),
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
