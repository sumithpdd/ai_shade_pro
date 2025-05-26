// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_analysis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkinAnalysisResult _$SkinAnalysisResultFromJson(Map<String, dynamic> json) =>
    SkinAnalysisResult(
      bestMatchShade: json['bestMatchShade'] as String,
      alternativeShades:
          (json['alternativeShades'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      undertone: json['undertone'] as String,
      skinTone: json['skinTone'] as String,
      analysisImageUrl: json['analysisImageUrl'] as String,
      shadeDepth: json['shadeDepth'] as String,
    );

Map<String, dynamic> _$SkinAnalysisResultToJson(SkinAnalysisResult instance) =>
    <String, dynamic>{
      'bestMatchShade': instance.bestMatchShade,
      'alternativeShades': instance.alternativeShades,
      'undertone': instance.undertone,
      'skinTone': instance.skinTone,
      'analysisImageUrl': instance.analysisImageUrl,
      'shadeDepth': instance.shadeDepth,
    };
