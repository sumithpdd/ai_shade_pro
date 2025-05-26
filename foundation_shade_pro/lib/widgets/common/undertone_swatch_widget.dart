import 'package:flutter/material.dart';

class UndertoneSwatchWidget extends StatelessWidget {
  final String? selectedUndertone;
  final void Function(String)? onSelect;
  final bool showLegend;
  const UndertoneSwatchWidget({
    Key? key,
    this.selectedUndertone,
    this.onSelect,
    this.showLegend = true,
  }) : super(key: key);

  static const undertones = [
    {'code': 'W', 'label': 'Warm', 'color': Color(0xFFF9C89B)},
    {'code': 'NW', 'label': 'Neutral Warm', 'color': Color(0xFFF7D6B2)},
    {'code': 'N', 'label': 'Neutral', 'color': Color(0xFFF5E2C8)},
    {'code': 'NC', 'label': 'Neutral Cool', 'color': Color(0xFFE6D6B2)},
    {'code': 'C', 'label': 'Cool', 'color': Color(0xFFD6EAF8)},
  ];
  static const undertoneDescriptions = {
    'W': 'is for rosy / red undertones',
    'NW': 'is for mostly rosy / red / sometimes peachy undertones',
    'N': 'is for peachy with an equal balance of rosy + golden undertones',
    'NC': 'is for mostly golden / olive / sometimes peachy undertones',
    'C': 'is for golden / olive undertones',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: CustomPaint(
            size: const Size(320, 120),
            painter: _UndertoneArcPainter(selectedUndertone),
          ),
        ),
        if (showLegend)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  undertones
                      .map(
                        (u) => Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: u['color'] as Color,
                              radius: 10,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${u['code']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('${u['label']}'),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                undertoneDescriptions[u['code']]!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
      ],
    );
  }
}

class _UndertoneArcPainter extends CustomPainter {
  final String? selected;
  _UndertoneArcPainter(this.selected);
  @override
  void paint(Canvas canvas, Size size) {
    final undertones = UndertoneSwatchWidget.undertones;
    final arcWidth = size.width / undertones.length;
    final paint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < undertones.length; i++) {
      final u = undertones[i];
      paint.color = u['color'] as Color;
      final rect = Rect.fromLTWH(i * arcWidth, 0, arcWidth, size.height);
      final path =
          Path()
            ..moveTo(rect.left, size.height)
            ..arcTo(rect, 3.14, -3.14, false)
            ..close();
      if (selected != null &&
          (selected!.toLowerCase().contains(
                (u['label'] as String).toLowerCase(),
              ) ||
              selected == u['code'])) {
        paint.color = (u['color'] as Color).withOpacity(0.85);
        canvas.drawShadow(path, Colors.black, 6, false);
      }
      canvas.drawPath(path, paint);
    }
    // Draw labels
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    for (int i = 0; i < undertones.length; i++) {
      final u = undertones[i];
      final label = u['code'] as String;
      textPainter.text = TextSpan(
        text: label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      );
      textPainter.layout();
      final x = (i + 0.5) * arcWidth - textPainter.width / 2;
      final y = size.height / 2 - textPainter.height / 2;
      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
