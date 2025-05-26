import 'package:flutter/material.dart';

class BestMatchCard extends StatelessWidget {
  final dynamic product;
  const BestMatchCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.08),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, color: Color(0xFF7B1FA2), size: 20),
                SizedBox(width: 6),
                Text(
                  'Best Match',
                  style: TextStyle(
                    color: Color(0xFF7B1FA2),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            product.imageUrl,
            width: 60,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7B1FA2),
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 8),
          // RatingStars and ColorSwatches will be replaced with extracted widgets
          // _buildRatingStars(4.5),
          // const SizedBox(height: 6),
          // _buildColorSwatches(product.shades),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.shopping_cart, color: Color(0xFF7B1FA2)),
              label: const Text('ADD TO CART'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade50,
                foregroundColor: Color(0xFF7B1FA2),
                textStyle: const TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
