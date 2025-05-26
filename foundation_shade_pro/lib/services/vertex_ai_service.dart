import 'dart:async';
import '../models/skin_analysis_result.dart';

class VertexAIService {
  Future<SkinAnalysisResult> analyzeSkin() async {
    // Simulate a 5 second delay for analysis (replace with real API call later)
    await Future.delayed(const Duration(seconds: 5));
    return SkinAnalysisResult(
      bestMatchShade: '250',
      alternativeShades: ['235N', '200'],
      undertone: 'Warm',
      skinTone: 'Medium',
      analysisImageUrl: 'https://link-to-analysis-image.jpg',
    );
  }
}
