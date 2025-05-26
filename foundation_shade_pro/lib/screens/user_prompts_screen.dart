import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/widgets/glamorous_background.dart';

class UserPromptsScreen extends StatefulWidget {
  const UserPromptsScreen({super.key});

  @override
  State<UserPromptsScreen> createState() => _UserPromptsScreenState();
}

class _UserPromptsScreenState extends State<UserPromptsScreen> {
  String? selectedFormula;
  String? selectedSkinTone;
  String? selectedSkinType;
  String? selectedCoverage;
  String? selectedUndertone;

  final formulas = [
    {'label': 'Liquid', 'image': 'https://i.imgur.com/6QKQ4Qp.png'},
    {'label': 'Cream', 'image': 'https://i.imgur.com/8QKQ4Qp.png'},
    {'label': 'Powder', 'image': 'https://i.imgur.com/9QKQ4Qp.png'},
    {'label': 'Mousse', 'image': 'https://i.imgur.com/7QKQ4Qp.png'},
    {'label': 'Cushion', 'image': 'https://i.imgur.com/5QKQ4Qp.png'},
    {'label': 'Pressed', 'image': 'https://i.imgur.com/4QKQ4Qp.png'},
    {'label': 'Stick', 'image': 'https://i.imgur.com/3QKQ4Qp.png'},
  ];

  final skinTones = [
    'Very Light',
    'Light',
    'Light Medium',
    'Fairest',
    'Fair',
    'Medium Light',
    'Medium',
    'Medium Tan',
    'Tan',
    'Deep',
    'Very Deep',
    'Dark Tan',
    'Medium Dark',
    'Dark',
    'Deep Dark',
  ];

  final skinTypes = ['Dry', 'Combination', 'Normal'];
  final coverages = ['Medium', 'Full', 'Light'];
  final undertones = [
    {'label': 'Neutral', 'color': Color(0xFFF5E2C8)},
    {'label': 'Warm', 'color': Color(0xFFF9E3B4)},
    {'label': 'Cool', 'color': Color(0xFFD6EAF8)},
  ];

  void _submit() {
    // Pass data to recommendations screen (could use GoRouter extra or a provider)
    context.go('/recommendations');
  }

  @override
  Widget build(BuildContext context) {
    return GlamorousBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Tell us more about you'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('What foundation do you use?'),
                  _imageGrid(
                    formulas,
                    selectedFormula,
                    (val) => setState(() => selectedFormula = val),
                  ),
                  const SizedBox(height: 24),
                  _sectionTitle('What is your skin tone?'),
                  _skinToneGrid(),
                  const SizedBox(height: 24),
                  _sectionTitle('What is your skin type?'),
                  _choiceRow(
                    skinTypes,
                    selectedSkinType,
                    (val) => setState(() => selectedSkinType = val),
                  ),
                  const SizedBox(height: 24),
                  _sectionTitle('Coverage'),
                  _choiceRow(
                    coverages,
                    selectedCoverage,
                    (val) => setState(() => selectedCoverage = val),
                  ),
                  const SizedBox(height: 24),
                  _sectionTitle('What is your undertone?'),
                  _undertoneRow(),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.go('/recommendations'),
                          child: const Text('Skip'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: 'Georgia',
      ),
    ),
  );

  Widget _imageGrid(
    List<Map<String, dynamic>> items,
    String? selected,
    Function(String) onSelect,
  ) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children:
          items.map((item) {
            final isSelected = selected == item['label'];
            return GestureDetector(
              onTap: () => onSelect(item['label']),
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color:
                      isSelected
                          ? Colors.blue.withOpacity(0.08)
                          : Colors.white.withOpacity(0.7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(item['image'], height: 48),
                    const SizedBox(height: 8),
                    Text(
                      item['label'],
                      style: const TextStyle(fontFamily: 'Georgia'),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _skinToneGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      children:
          skinTones.map((tone) {
            final isSelected = selectedSkinTone == tone;
            return GestureDetector(
              onTap: () => setState(() => selectedSkinTone = tone),
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color:
                      isSelected
                          ? Colors.blue.withOpacity(0.08)
                          : Colors.white.withOpacity(0.7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.brush,
                      color: isSelected ? Colors.blue : Colors.brown,
                      size: 36,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tone,
                      style: const TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _choiceRow(
    List<String> options,
    String? selected,
    Function(String) onSelect,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          options.map((opt) {
            final isSelected = selected == opt;
            return Expanded(
              child: GestureDetector(
                onTap: () => onSelect(opt),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color:
                        isSelected
                            ? Colors.blue.withOpacity(0.08)
                            : Colors.white.withOpacity(0.7),
                  ),
                  child: Center(
                    child: Text(
                      opt,
                      style: const TextStyle(fontFamily: 'Georgia'),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _undertoneRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          undertones.map((u) {
            final isSelected = selectedUndertone == u['label'];
            return Expanded(
              child: GestureDetector(
                onTap:
                    () => setState(
                      () => selectedUndertone = u['label'] as String,
                    ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color:
                        isSelected
                            ? Colors.blue.withOpacity(0.08)
                            : Colors.white.withOpacity(0.7),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: u['color'] as Color,
                        radius: 16,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        u['label'] as String,
                        style: const TextStyle(fontFamily: 'Georgia'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
