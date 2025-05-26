import 'package:flutter/material.dart';

const Map<String, Map<String, String>> shadeFinderGuide = {
  'Yellow': {
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

String? getShadeCode(String undertone, String skinTone) {
  String undertoneKey;
  switch (undertone.toLowerCase()) {
    case 'warm':
      undertoneKey = 'Yellow';
      break;
    case 'neutral':
      undertoneKey = 'Neutral';
      break;
    case 'cool':
      undertoneKey = 'Red';
      break;
    default:
      return null;
  }
  return shadeFinderGuide[undertoneKey]?[skinTone];
}

const Map<String, Color> shadeCodeColors = {
  '100': Color(0xFFF8E2C8),
  '101': Color(0xFFF3D6B6),
  '103': Color(0xFFE9C7A0),
  '105': Color(0xFFDDB88A),
  '109': Color(0xFFC9A06B),
  '110': Color(0xFFD1A97B),
  '112': Color(0xFFB98A5A),
  '115': Color(0xFF9C6B3F),
  '120': Color(0xFF7C4A23),
};
