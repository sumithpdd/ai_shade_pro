import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_ai/firebase_ai.dart';
import 'skin_analysis_prompt.dart';

class GeminiService {
  final gemini = FirebaseAI.vertexAI().generativeModel(
    systemInstruction: Content.text(skinAnalysisPrompt),
    model: 'gemini-2.0-flash',
  );

  Future<Map<String, dynamic>?> analyzeSkin(Uint8List imageBytes) async {
    final chat = gemini.startChat();
    final prompt = Content.multi([
      TextPart('Analyze the following image for skin tone and undertone.'),
      InlineDataPart('image/jpeg', imageBytes),
    ]);
    final response = await chat.sendMessage(prompt);

    // Parse the JSON from the response text
    try {
      String jsonString = response.text!.trim();

      // Remove Markdown code block if present (handles ```json and ```)
      final codeBlockRegExp = RegExp(
        r'^```[a-zA-Z]*\s*|\s*```$',
        multiLine: true,
      );
      jsonString = jsonString.replaceAll(codeBlockRegExp, '').trim();

      return jsonString.isNotEmpty ? jsonDecode(jsonString) : null;
    } catch (e) {
      print('Error parsing Gemini response: $e');
      return null;
    }
  }
}
