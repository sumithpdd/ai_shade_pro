import 'package:flutter/material.dart';

class ColorSwatches extends StatelessWidget {
  final List<String> shades;
  const ColorSwatches({Key? key, required this.shades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          shades.map((shade) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _getShadeColor(shade),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList(),
    );
  }

  Color _getShadeColor(String shade) {
    // Dummy mapping for demo
    switch (shade) {
      case '235N':
        return const Color(0xFFF3D1B0);
      case '250W':
        return const Color(0xFFE2B07A);
      case '450W':
        return const Color(0xFF8B5C2B);
      case '335W':
        return const Color(0xFFD1A06B);
      case '04 Beige Nature':
        return const Color(0xFFE7CBA9);
      case '510 Suede C':
        return const Color(0xFF6B4A2B);
      case '10 Praline':
        return const Color(0xFFC68642);
      case '250':
        return const Color(0xFFE2B07A);
      case '200':
        return const Color(0xFFD1A06B);
      case '180':
        return const Color(0xFFF3D1B0);
      case '110C':
        return const Color(0xFFF3D1B0);
      case '220N':
        return const Color(0xFFE2B07A);
      case '330W':
        return const Color(0xFF8B5C2B);
      case '120':
        return const Color(0xFFF3D1B0);
      case '210':
        return const Color(0xFFE2B07A);
      case '320':
        return const Color(0xFF8B5C2B);
      case '101':
        return const Color(0xFFF3D1B0);
      case '202':
        return const Color(0xFFE2B07A);
      case '303':
        return const Color(0xFF8B5C2B);
      case '105':
        return const Color(0xFFF3D1B0);
      case '205':
        return const Color(0xFFE2B07A);
      case '305':
        return const Color(0xFF8B5C2B);
      default:
        return Colors.brown.shade200;
    }
  }
}
