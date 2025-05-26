import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ScreenshotHelper {
  static final ScreenshotController _screenshotController =
      ScreenshotController();

  static Future<void> captureScreen(String screenName) async {
    try {
      final bytes = await _screenshotController.capture();
      if (bytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/$screenName.png';
        final imageFile = File(imagePath);
        await imageFile.writeAsBytes(bytes);
        print('Screenshot saved to: $imagePath');
      }
    } catch (e) {
      print('Error capturing screenshot: $e');
    }
  }

  static Widget wrapWithScreenshot({
    required Widget child,
    required String screenName,
  }) {
    return Screenshot(controller: _screenshotController, child: child);
  }
}
