import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foundation_shade_pro/screens/home_screen.dart';
import 'package:foundation_shade_pro/screens/scan_screen.dart';
import 'package:foundation_shade_pro/screens/analysis_screen.dart';
import 'package:foundation_shade_pro/screens/recommendations_screen.dart';
import 'package:foundation_shade_pro/screens/user_prompts_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/scan', builder: (context, state) => const ScanScreen()),
      GoRoute(
        path: '/analysis',
        builder: (context, state) => const AnalysisScreen(),
      ),
      GoRoute(
        path: '/user-prompts',
        builder: (context, state) => const UserPromptsScreen(),
      ),
      GoRoute(
        path: '/recommendations',
        builder: (context, state) => const RecommendationsScreen(),
      ),
    ],
  );
});
