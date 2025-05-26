import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/providers/dummy_data_provider.dart';
import 'package:foundation_shade_pro/widgets/glamorous_background.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';

class RecommendationsScreen extends ConsumerWidget {
  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final foundationCategory = categories.firstWhere(
      (category) => category.id == 'foundation',
    );
    final bestMatchId = 'teint_idole_ultra_wear'; // hardcoded for demo
    final bestMatch = foundationCategory.products.firstWhere(
      (p) => p.id == bestMatchId,
    );
    final otherOptions =
        foundationCategory.products.where((p) => p.id != bestMatchId).toList();

    return GlamorousBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Shimmer.fromColors(
            baseColor: Colors.purple.shade700,
            highlightColor: Colors.amber.shade200,
            child: const Text(
              'Recommendations',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF7B1FA2),
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.white,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF7B1FA2),
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'We have found the perfect shade for you!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                          color: Color(0xFF7B1FA2),
                          letterSpacing: 0.5,
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
                  const SizedBox(height: 4),
                  const Text(
                    'We found the perfect match for you!',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Georgia',
                      color: Color(0xFF7B1FA2),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          blurRadius: 1,
                          color: Colors.white,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBestMatchCard(context, bestMatch),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Icon(Icons.list_alt, color: Color(0xFF7B1FA2), size: 22),
                      const SizedBox(width: 8),
                      const Text(
                        'Other Options',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                          color: Color(0xFF7B1FA2),
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
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.62,
                        ),
                    itemCount: min(otherOptions.length, 4),
                    itemBuilder: (context, index) {
                      return _buildProductGridCard(
                        context,
                        otherOptions[index],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
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
                      onPressed: () {
                        ref.refresh(skinAnalysisProvider);
                        context.go('/scan');
                      },
                      child: const Text('Start Over'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBestMatchCard(BuildContext context, product) {
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
          _buildRatingStars(4.5),
          const SizedBox(height: 6),
          _buildColorSwatches(product.shades),
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

  Widget _buildProductGridCard(
    BuildContext context,
    product, {
    bool highlight = false,
  }) {
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
          _buildRatingStars(4.5),
          const SizedBox(height: 6),
          _buildColorSwatches(product.shades),
          const SizedBox(height: 6),
          Text(
            '£${product.price.toStringAsFixed(2)}',
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

  Widget _buildRatingStars(double rating) {
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

  Widget _buildColorSwatches(List<String> shades) {
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
