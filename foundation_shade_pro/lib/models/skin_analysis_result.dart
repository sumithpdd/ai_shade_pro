import 'package:json_annotation/json_annotation.dart';

part 'skin_analysis_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SkinAnalysisResult {
  final String bestMatchShade;
  final List<String> alternativeShades;
  final String undertone; // e.g., 'Warm', 'Cool', 'Neutral'
  final String skinTone; // e.g., 'Medium', 'Deep', 'Fair'
  final String analysisImageUrl;
  final String shadeDepth; // e.g., 'RICH', 'DEEP', etc.

  SkinAnalysisResult({
    required this.bestMatchShade,
    required this.alternativeShades,
    required this.undertone,
    required this.skinTone,
    required this.analysisImageUrl,
    required this.shadeDepth,
  });

  factory SkinAnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$SkinAnalysisResultFromJson(json);
  Map<String, dynamic> toJson() => _$SkinAnalysisResultToJson(this);
}
