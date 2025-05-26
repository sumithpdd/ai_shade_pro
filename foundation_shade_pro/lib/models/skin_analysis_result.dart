class SkinAnalysisResult {
  final String bestMatchShade;
  final List<String> alternativeShades;
  final String undertone; // e.g., 'Warm', 'Cool', 'Neutral'
  final String skinTone; // e.g., 'Medium', 'Deep', 'Fair'
  final String analysisImageUrl;

  SkinAnalysisResult({
    required this.bestMatchShade,
    required this.alternativeShades,
    required this.undertone,
    required this.skinTone,
    required this.analysisImageUrl,
  });
}
