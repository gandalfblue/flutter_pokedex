import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../widgets/button_widget.dart';
import '../widgets/onboarding_one_widget.dart';
import '../widgets/onborading_two_widget.dart';
import '../widgets/page_indicator_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _next() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.pokemonList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (i) => setState(() => _currentPage = i),
              children: const [OnboardingOneWidget(), OnboardingTwoWidget()],
            ),
          ),
          SizedBox(height: 30),
          PageIndicatorWidget(currentPage: _currentPage, totalPages: 2),
          const SizedBox(height: 16),
          ButtonWidget(
            label: _currentPage == 0 ? 'Continuar' : 'Empezamos',
            onTap: _next,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
