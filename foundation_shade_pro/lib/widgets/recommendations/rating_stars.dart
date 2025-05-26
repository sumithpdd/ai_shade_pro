import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (rating >= index + 1) {
          return const Icon(Icons.star, color: Colors.amber, size: 18);
        } else if (rating > index && rating < index + 1) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 18);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 18);
        }
      }),
    );
  }
}
