import 'package:flutter/material.dart';
import '../common/skin_type_selector.dart';
import '../common/skin_goals_selector.dart';

class PromptSection extends StatelessWidget {
  final String? selectedFormula;
  final String? selectedSkinTone;
  final String? selectedSkinType;
  final String? selectedCoverage;
  final String? selectedUndertone;
  final List<String> formulas;
  final List<String> skinTones;
  final List<String> skinTypes;
  final List<String> coverages;
  final List<Map<String, Object>> undertones;
  final TextEditingController aboutController;
  final void Function(String) onFormulaSelect;
  final void Function(String) onSkinToneSelect;
  final void Function(String) onSkinTypeSelect;
  final void Function(String) onCoverageSelect;
  final void Function(String) onUndertoneSelect;
  final List<Map<String, dynamic>>? skinGoals;
  final List<String>? selectedSkinGoals;
  final void Function(String)? onToggleSkinGoal;

  const PromptSection({
    Key? key,
    required this.selectedFormula,
    required this.selectedSkinTone,
    required this.selectedSkinType,
    required this.selectedCoverage,
    required this.selectedUndertone,
    required this.formulas,
    required this.skinTones,
    required this.skinTypes,
    required this.coverages,
    required this.undertones,
    required this.aboutController,
    required this.onFormulaSelect,
    required this.onSkinToneSelect,
    required this.onSkinTypeSelect,
    required this.onCoverageSelect,
    required this.onUndertoneSelect,
    this.skinGoals,
    this.selectedSkinGoals,
    this.onToggleSkinGoal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tell us more about you (optional)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
              color: Color(0xFF7B1FA2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _promptSection(
          'What foundation do you use?',
          formulas,
          selectedFormula,
          onFormulaSelect,
          icon: Icons.format_paint,
        ),
        const SizedBox(height: 16),
        _promptSection(
          'What is your skin tone?',
          skinTones,
          selectedSkinTone,
          onSkinToneSelect,
          icon: Icons.color_lens,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'How would you describe your skin type?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
              color: Color(0xFF7B1FA2),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SkinTypeSelector(
          skinTypes: skinTypes,
          selectedSkinType: selectedSkinType,
          onSelect: onSkinTypeSelect,
        ),
        const SizedBox(height: 16),
        _promptSection(
          'Coverage',
          coverages,
          selectedCoverage,
          onCoverageSelect,
          icon: Icons.layers,
        ),
        const SizedBox(height: 16),
        _undertonePrompt(),
        const SizedBox(height: 16),
        TextField(
          controller: aboutController,
          decoration: InputDecoration(
            labelText: 'Anything else? (optional)',
            labelStyle: const TextStyle(color: Color(0xFF7B1FA2)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
          ),
          maxLines: 2,
        ),
        if (skinGoals != null &&
            selectedSkinGoals != null &&
            onToggleSkinGoal != null) ...[
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'What are your top skin goals?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
                color: Color(0xFF7B1FA2),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SkinGoalsSelector(
            skinGoals: skinGoals!,
            selectedGoals: selectedSkinGoals!,
            onToggleGoal: onToggleSkinGoal!,
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _promptSection(
    String title,
    List<String> options,
    String? selected,
    Function(String) onSelect, {
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFF7B1FA2), size: 20),
              const SizedBox(width: 6),
            ],
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B1FA2),
                fontFamily: 'Georgia',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              options.map((opt) {
                final isSelected = selected == opt;
                return ChoiceChip(
                  label: Text(
                    opt,
                    style: const TextStyle(fontFamily: 'Georgia'),
                  ),
                  selected: isSelected,
                  selectedColor: const Color(0xFFB39DDB),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF7B1FA2),
                  ),
                  onSelected: (_) => onSelect(opt),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _undertonePrompt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.wb_sunny, color: Color(0xFF7B1FA2), size: 20),
            SizedBox(width: 6),
            Text(
              'What is your undertone?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B1FA2),
                fontFamily: 'Georgia',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              undertones.map((u) {
                final isSelected = selectedUndertone == u['label'];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(
                      u['label'] as String,
                      style: const TextStyle(fontFamily: 'Georgia'),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFFB39DDB),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color:
                          isSelected ? Colors.white : const Color(0xFF7B1FA2),
                    ),
                    avatar: CircleAvatar(
                      backgroundColor: u['color'] as Color,
                      radius: 10,
                    ),
                    onSelected: (_) => onUndertoneSelect(u['label'] as String),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
