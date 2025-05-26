import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color valueColor;
  final String description;
  final bool highlight;

  const ResultCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.valueColor,
    required this.description,
    this.highlight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: highlight ? Colors.white : Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: valueColor, size: 28),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xFF7B1FA2),
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: valueColor,
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7B1FA2),
              fontFamily: 'Georgia',
            ),
          ),
        ],
      ),
    );
  }
}
