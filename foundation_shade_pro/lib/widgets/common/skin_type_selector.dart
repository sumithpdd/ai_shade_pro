import 'package:flutter/material.dart';
import '../../utils/skin_icons.dart';

class SkinTypeSelector extends StatelessWidget {
  final List<String> skinTypes;
  final String? selectedSkinType;
  final void Function(String)? onSelect;
  const SkinTypeSelector({
    Key? key,
    required this.skinTypes,
    this.selectedSkinType,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          skinTypes.map((type) {
            final isSelected = selectedSkinType == type;
            return GestureDetector(
              onTap: onSelect != null ? () => onSelect!(type) : null,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isSelected ? Colors.deepPurple : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color:
                      isSelected
                          ? Colors.deepPurple.withOpacity(0.08)
                          : Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(
                      getSkinTypeIcon(type),
                      size: 36,
                      color: isSelected ? Colors.deepPurple : Colors.black54,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      type.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.deepPurple : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
