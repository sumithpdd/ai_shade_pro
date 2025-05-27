import 'package:firebase_ai/firebase_ai.dart';

final getShadeFinderTable = FunctionDeclaration(
  'getShadeFinderTable',
  '  Select the most appropriate shade number for the user, based on their undertone and skin tone:',
  parameters: {
    'undertone': Schema.string(
      description: 'The undertone of the user',
      format: 'string',
      nullable: false,
      title: 'Undertone',
    ),
    'skinTone': Schema.string(description: 'The skin tone of the user'),
  },
);

Map<String, Object?> handleFunctionCall(
  // Add from here
  String functionName,
  Map<String, Object?> arguments,
) {
  return switch (functionName) {
    'getShadeFinderTable' => handlegetShadeFinderTableTool(arguments),
    _ => handleUnknownFunction(functionName),
  };
}

Map<String, Object?> handlegetShadeFinderTableTool(
  Map<String, Object?> arguments,
) {
  final undertone = arguments['undertone'] as String?;
  final skinTone = arguments['skinTone'] as String?;

  print('undertone: $undertone');
  print('skinTone: $skinTone');

  if (undertone == null || skinTone == null) {
    return {
      'success': false,
      'reason': 'Missing required parameters',
      'shadeNumber': null,
    };
  }

  final shadeFinderTable = {
    'Yellow': {
      'Fair': '100',
      'Light': '100',
      'Light Medium': '110',
      'Medium': '109',
      'Dark': '115',
    },
    'Warm': {
      'Fair': '100',
      'Light': '100',
      'Light Medium': '110',
      'Medium': '109',
      'Dark': '115',
    },
    'Neutral': {
      'Fair': '101',
      'Light': '103',
      'Light Medium': '105',
      'Medium': '112',
      'Dark': '115',
    },
    'Red': {
      'Fair': '101',
      'Fair-Light': '103',
      'Light Medium': '105',
      'Medium': '112',
      'Dark': '120',
    },
  };

  final shadeNumber = shadeFinderTable[undertone]?[skinTone];
  if (shadeNumber == null) {
    return {
      'success': false,
      'reason': 'No matching shade found',
      'shadeNumber': null,
    };
  }

  return {
    'success': true,
    'shadeNumber': shadeNumber,
    'undertone': undertone,
    'skinTone': skinTone,
  };
}

Map<String, Object?> handleUnknownFunction(String functionName) {
  print('Unsupported function call $functionName');
  return {
    'success': false,
    'reason': 'Unsupported function call $functionName',
  };
}
