import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/foundation_category.dart';
import '../models/skin_analysis_result.dart';
import '../services/gemini_service.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

final categoriesProvider = Provider<List<FoundationCategory>>(
  (ref) => [
    FoundationCategory(
      id: 'foundation',
      name: 'Foundation',
      products: [
        Product(
          id: 'teint_idole_ultra_wear',
          name:
              'Lancôme Teint Idole Ultra Wear Long-Lasting Foundation SPF 15 30ml',
          description: '24H tenue & confort. Sans retouche. SPF 15.',
          imageUrl: 'assets/product_images/lancome.png',
          shades: ['235N', '250W', '450W'],
          price: 34.50,
          brand: 'Lancôme',
          categoryId: 'foundation',
          tags: ['Bestseller', 'Matte', 'Long-wear'],
        ),
        Product(
          id: 'revlon_colorstay',
          name: 'Revlon ColorStay Foundation For Normal/Dry Skin',
          description: 'Longwear makeup. Hyaluronic acid. SPF 20.',
          imageUrl: 'assets/product_images/revlon.png',
          shades: ['250', '200', '180'],
          price: 13.99,
          brand: 'Revlon',
          categoryId: 'foundation',
          tags: ['Longwear', 'SPF', 'Hydrating'],
        ),
        Product(
          id: 'lancome_matte',
          name: 'Lancôme Ultra Matte Foundation',
          description: 'Matte finish, oil control, 16H wear.',
          imageUrl: 'assets/product_images/lancome.png',
          shades: ['110C', '220N', '330W'],
          price: 36.00,
          brand: 'Lancôme',
          categoryId: 'foundation',
          tags: ['Matte', 'Oil Control'],
        ),
        Product(
          id: 'revlon_glow',
          name: 'Revlon Glow Foundation',
          description: 'Radiant finish, vitamin E, SPF 15.',
          imageUrl: 'assets/product_images/revlon.png',
          shades: ['120', '210', '320'],
          price: 15.50,
          brand: 'Revlon',
          categoryId: 'foundation',
          tags: ['Glow', 'Radiant', 'SPF'],
        ),
        Product(
          id: 'lancome_hydra',
          name: 'Lancôme Hydra Dewy Foundation',
          description: 'Hydrating, dewy finish, 24H moisture.',
          imageUrl: 'assets/product_images/lancome.png',
          shades: ['101', '202', '303'],
          price: 38.00,
          brand: 'Lancôme',
          categoryId: 'foundation',
          tags: ['Hydrating', 'Dewy'],
        ),
        Product(
          id: 'revlon_matte',
          name: 'Revlon Stay Matte Foundation',
          description: 'Matte, lightweight, all-day wear.',
          imageUrl: 'assets/product_images/revlon.png',
          shades: ['105', '205', '305'],
          price: 12.99,
          brand: 'Revlon',
          categoryId: 'foundation',
          tags: ['Matte', 'Lightweight'],
        ),
        Product(
          id: 'teint_idole_ultra_wear_care_glow',
          name: 'Teint Idole Ultra Wear Care & Glow Foundation',
          description: 'Medium buildable coverage & healthy glow finish.',
          imageUrl:
              'https://www.lancome.co.uk/on/demandware.static/-/Sites-lancome-master-catalog/default/dw3e3e3e3e/2022/teint-idole-ultra-wear-care-glow.png',
          shades: ['335W', '250W', '235N'],
          price: 32.80,
          brand: 'Lancome',
          categoryId: 'foundation',
          tags: ['Bestseller', 'Glow', 'SPF'],
        ),
        Product(
          id: 'teint_miracle',
          name: 'Teint Miracle',
          description: 'Bare skin foundation. Luminous satiny finish.',
          imageUrl:
              'https://www.lancome.co.uk/on/demandware.static/-/Sites-lancome-master-catalog/default/dw4e4e4e4e/2022/teint-miracle.png',
          shades: ['04 Beige Nature', '250W'],
          price: 32.80,
          brand: 'Lancome',
          categoryId: 'foundation',
          tags: ['SPF', 'Luminous'],
        ),
        Product(
          id: 'teint_idole_ultra_wear_stick',
          name: 'Teint Idole Ultra Wear Stick Foundation',
          description: 'Up to 24H wear & comfort stick foundation.',
          imageUrl:
              'https://www.lancome.co.uk/on/demandware.static/-/Sites-lancome-master-catalog/default/dw5e5e5e5e/2022/teint-idole-ultra-wear-stick.png',
          shades: ['510 Suede C', '10 Praline'],
          price: 27.20,
          brand: 'Lancome',
          categoryId: 'foundation',
          tags: ['Stick', 'Long-wear'],
        ),
      ],
    ),
    FoundationCategory(id: 'primer', name: 'Primer', products: []),
    FoundationCategory(id: 'blush', name: 'Blush', products: []),
    FoundationCategory(id: 'highlighter', name: 'Highlighter', products: []),
    FoundationCategory(id: 'concealer', name: 'Concealer', products: []),
    FoundationCategory(id: 'compact', name: 'Compact', products: []),
  ],
);

final skinAnalysisProvider = FutureProvider<SkinAnalysisResult>((ref) async {
  final Uint8List sumithImageBytes = await rootBundle
      .load('assets/test_users/dummy_photo_sumith.png')
      .then((bd) => bd.buffer.asUint8List());
  final geminiService = GeminiService();
  final json = await geminiService.analyzeSkin(sumithImageBytes);
  if (json == null) {
    throw Exception('Failed to analyze skin');
  }
  return SkinAnalysisResult.fromJson(json);
});
