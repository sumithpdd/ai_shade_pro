import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/providers/dummy_data_provider.dart';
import 'package:foundation_shade_pro/widgets/glamorous_background.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:foundation_shade_pro/widgets/analysis/result_card.dart';
import 'package:foundation_shade_pro/widgets/analysis/prompt_section.dart';
import 'package:foundation_shade_pro/widgets/analysis/radar_loading.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  const AnalysisScreen({super.key});

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen>
    with TickerProviderStateMixin {
  String? selectedFormula;
  String? selectedSkinTone;
  String? selectedSkinType;
  String? selectedCoverage;
  String? selectedUndertone;

  final formulas = [
    'Liquid',
    'Cream',
    'Powder',
    'Mousse',
    'Cushion',
    'Pressed',
    'Stick',
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

  final TextEditingController _aboutController = TextEditingController();

  late AnimationController _cardController;
  late AnimationController _promptController;
  late Animation<double> _cardOpacity;
  late Animation<Offset> _cardOffset;
  late Animation<double> _promptOpacity;
  late Animation<Offset> _promptOffset;

  @override
  void initState() {
    super.initState();
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _promptController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _cardOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeOut));
    _cardOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _cardController, curve: Curves.easeOut));
    _promptOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _promptController, curve: Curves.easeOut),
    );
    _promptOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _promptController, curve: Curves.easeOut),
    );
    _cardController.forward();
    Future.delayed(
      const Duration(milliseconds: 400),
      () => _promptController.forward(),
    );
  }

  @override
  void dispose() {
    _cardController.dispose();
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final analysisAsync = ref.watch(skinAnalysisProvider);
    return GlamorousBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(Icons.analytics, color: Color(0xFF7B1FA2), size: 26),
              SizedBox(width: 8),
              Text(
                'Step 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B1FA2),
                  fontFamily: 'Georgia',
                  letterSpacing: 1.1,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.white,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: analysisAsync.when(
            loading:
                () => Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/test_users/dummy_photo_sumith.png',
                          fit: BoxFit.cover,
                          width: 110,
                          height: 110,
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Opacity(opacity: 0.7, child: RadarLoading()),
                        ),
                      ),
                      Positioned(
                        bottom: -40,
                        child: Text(
                          'Analyzing...',
                          style: TextStyle(
                            color: Color(0xFF7B1FA2),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Georgia',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            error: (e, st) => Center(child: Text('Error: $e')),
            data:
                (analysis) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.analytics,
                              color: Color(0xFF7B1FA2),
                              size: 22,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Skin Analysis',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF7B1FA2),
                                fontFamily: 'Georgia',
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    blurRadius: 1,
                                    color: Colors.white,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Your skin tone and undertone analysis results',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7B1FA2),
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                blurRadius: 1,
                                color: Colors.white,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/test_users/dummy_photo_sumith.png',
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        AnimatedOpacity(
                          opacity: _cardOpacity.value,
                          duration: const Duration(milliseconds: 700),
                          child: AnimatedSlide(
                            offset: _cardOffset.value,
                            duration: const Duration(milliseconds: 700),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ResultCard(
                                        icon: Icons.palette,
                                        title: 'Skin Tone',
                                        value: analysis.skinTone,
                                        valueColor: Colors.deepPurple,
                                        description:
                                            'Classified as ${analysis.skinTone.toLowerCase()}',
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ResultCard(
                                        icon: Icons.wb_sunny,
                                        title: 'Undertone',
                                        value: analysis.undertone,
                                        valueColor: Colors.orangeAccent,
                                        description:
                                            '${analysis.undertone} undertones',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ResultCard(
                                        icon: Icons.star,
                                        title: 'Best Match',
                                        value: analysis.bestMatchShade,
                                        valueColor: Color(0xFF7B1FA2),
                                        description:
                                            'Your perfect foundation shade',
                                        highlight: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        AnimatedOpacity(
                          opacity: _promptOpacity.value,
                          duration: const Duration(milliseconds: 700),
                          child: AnimatedSlide(
                            offset: _promptOffset.value,
                            duration: const Duration(milliseconds: 700),
                            child: Column(
                              children: [
                                PromptSection(
                                  selectedFormula: selectedFormula,
                                  selectedSkinTone: selectedSkinTone,
                                  selectedSkinType: selectedSkinType,
                                  selectedCoverage: selectedCoverage,
                                  selectedUndertone: selectedUndertone,
                                  formulas: formulas,
                                  skinTones: skinTones,
                                  skinTypes: skinTypes,
                                  coverages: coverages,
                                  undertones: undertones,
                                  aboutController: _aboutController,
                                  onFormulaSelect:
                                      (val) =>
                                          setState(() => selectedFormula = val),
                                  onSkinToneSelect:
                                      (val) => setState(
                                        () => selectedSkinTone = val,
                                      ),
                                  onSkinTypeSelect:
                                      (val) => setState(
                                        () => selectedSkinType = val,
                                      ),
                                  onCoverageSelect:
                                      (val) => setState(
                                        () => selectedCoverage = val,
                                      ),
                                  onUndertoneSelect:
                                      (val) => setState(
                                        () => selectedUndertone = val,
                                      ),
                                ),
                                const SizedBox(height: 32),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 8,
                                      backgroundColor: const Color(0xFFB39DDB),
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                        fontFamily: 'Georgia',
                                      ),
                                    ),
                                    onPressed:
                                        () => context.go('/recommendations'),
                                    child: const Text('Continue'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
