import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:foundation_shade_pro/services/tools.dart';
import 'skin_analysis_prompt.dart';

class GeminiService {
  final gemini = FirebaseAI.vertexAI().generativeModel(
    systemInstruction: Content.text(skinAnalysisPrompt),
    model: 'gemini-2.0-flash',
    toolConfig: ToolConfig(
      functionCallingConfig: FunctionCallingConfig.any({'getShadeFinderTable'}),
    ),
    tools: [
      Tool.functionDeclarations([getShadeFinderTable]),
    ],
  );

  Future<Map<String, dynamic>?> analyzeSkin(Uint8List imageBytes) async {
    final chat = gemini.startChat();
    final prompt = Content.multi([
      TextPart('Analyze the following image for skin tone and undertone.'),
      InlineDataPart('image/jpeg', imageBytes),
    ]);

    final response = await chat.sendMessage(prompt);
    print('Initial response: ${response.text}');

    if (response.functionCalls.isNotEmpty) {
      final functionCall = response.functionCalls.first;
      final functionResult = handleFunctionCall(
        functionCall.name,
        functionCall.args,
      );
      print('Function result: $functionResult');

      if (functionResult['success'] == true) {
        // Send function result back to Gemini
        final functionResponse = await chat.sendMessage(
          Content.functionResponses([
            FunctionResponse(functionCall.name, functionResult),
          ]),
        );
        print('Function response: ${functionResponse.text}');

        // If no text response, send a follow-up message
        if (functionResponse.text == null) {
          final followUpResponse = await chat.sendMessage(
            Content.text(
              'Please return the JSON response using the shade number from the tool response.',
            ),
          );
          print('Follow-up response: ${followUpResponse.text}');

          if (followUpResponse.text != null) {
            try {
              String jsonString = followUpResponse.text!.trim();
              print('Raw response: $jsonString');

              // Remove any markdown or extra text
              final codeBlockRegExp = RegExp(
                r'^```[a-zA-Z]*\s*|\s*```$',
                multiLine: true,
              );
              jsonString = jsonString.replaceAll(codeBlockRegExp, '').trim();

              print('Cleaned JSON string: $jsonString');
              return jsonDecode(jsonString);
            } catch (e) {
              print('Error parsing Gemini response: $e');
              return null;
            }
          }
        } else {
          try {
            String jsonString = functionResponse.text!.trim();
            print('Raw response: $jsonString');

            // Remove any markdown or extra text
            final codeBlockRegExp = RegExp(
              r'^```[a-zA-Z]*\s*|\s*```$',
              multiLine: true,
            );
            jsonString = jsonString.replaceAll(codeBlockRegExp, '').trim();

            print('Cleaned JSON string: $jsonString');
            return jsonDecode(jsonString);
          } catch (e) {
            print('Error parsing Gemini response: $e');
            return null;
          }
        }
      } else {
        print('Function call failed: ${functionResult['reason']}');
      }
    }

    return null;
  }
}
