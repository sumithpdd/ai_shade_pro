import 'package:flutter/material.dart';

class ProductGridCard extends StatelessWidget {
  final dynamic product;
  final bool highlight;
  const ProductGridCard({
    Key? key,
    required this.product,
    this.highlight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.08),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      margin: highlight ? const EdgeInsets.symmetric(vertical: 8) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imageUrl,
            width: 60,
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
              fontSize: 15,
              color: Color(0xFF7B1FA2),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF7B1FA2),
              fontFamily: 'Georgia',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          // RatingStars and ColorSwatches will be replaced with extracted widgets
          // _buildRatingStars(4.5),
          // const SizedBox(height: 6),
          // _buildColorSwatches(product.shades),
          const SizedBox(height: 6),
          Text(
            '£ 0{product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
              fontSize: 16,
              color: Color(0xFF7B1FA2),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.shopping_cart, color: Color(0xFF7B1FA2)),
              label: const Text('ADD TO CART'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Color(0xFF7B1FA2),
                side: const BorderSide(color: Color(0xFF7B1FA2)),
                textStyle: const TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                ),
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
