import 'package:flutter/material.dart';

IconData getSkinTypeIcon(String type) {
  switch (type.toLowerCase()) {
    case 'normal':
      return Icons.brightness_1; // Circle
    case 'combination':
      return Icons.blur_on; // Abstract
    case 'oily':
      return Icons.opacity; // Droplet
    case 'dry':
      return Icons.wb_sunny; // Sun
    default:
      return Icons.help_outline;
  }
}

IconData getFinishIcon(String finish) {
  switch (finish.toLowerCase()) {
    case 'radiant':
      return Icons.wb_incandescent; // Lightbulb
    case 'natural':
      return Icons.nature; // Nature
    case 'matte':
      return Icons.crop_square; // Square
    default:
      return Icons.help_outline;
  }
}
