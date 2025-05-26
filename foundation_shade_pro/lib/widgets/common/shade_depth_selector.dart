import 'package:flutter/material.dart';

class ShadeDepthSelector extends StatelessWidget {
  final List<String> shadeDepths;
  final String? selectedShadeDepth;
  final void Function(String)? onSelect;
  const ShadeDepthSelector({
    Key? key,
    required this.shadeDepths,
    this.selectedShadeDepth,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(shadeDepths.length, (i) {
          final isSelected = selectedShadeDepth == shadeDepths[i];
          return GestureDetector(
            onTap: onSelect != null ? () => onSelect!(shadeDepths[i]) : null,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(18),
                color:
                    isSelected
                        ? Colors.deepPurple.withOpacity(0.08)
                        : Colors.white,
              ),
              child: Text(
                shadeDepths[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.deepPurple : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
