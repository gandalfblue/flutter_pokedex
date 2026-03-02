import 'package:flutter/material.dart';
import 'package:flutter_pokedex/features/presentation/pages/error_page.dart';
import 'package:flutter_pokedex/features/presentation/widgets/button_widget.dart';
import 'package:flutter_pokedex/features/presentation/widgets/onboarding_one_widget.dart';
import 'package:flutter_pokedex/features/presentation/widgets/onborading_two_widget.dart';
import 'package:flutter_pokedex/features/presentation/widgets/page_indicator_widget.dart';

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
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ErrorPage(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
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
