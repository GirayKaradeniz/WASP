import 'package:flutter/material.dart';
import 'package:wasp_frontend/pages/login_page.dart';
import 'package:wasp_frontend/pages/signup_page.dart';
import '../resources/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      image: 'assets/onboarding1.png', // Replace with your asset
      title: 'Sınıf gruplarının 2.0 versiyonu',
      description:
          "Sınavlara 2 gün kala her şeyden bir parça eksik: uyku, motivasyon, kaynak.. Ama burada eksik olan bir şey yok: paylaşılan notlar, elden ele geçen özetler ve birbirine yardım eden öğrenciler.",
      boldText: '',
    ),
    _OnboardingData(
      image: 'assets/onboarding2.png', // Replace with your asset
      title: 'Studygram kültürünün\nnext level hali',
      description:
          "Not tutmakla kalma, paylaş. Sınav haftasında hepimiz aynı gemideyiz zaten. Renkli kalemlerin, özenli başlıkların, son gece yazılmış özetlerin değerini biliyoruz.",
      boldText: 'Not tutmakla kalma, paylaş.',
    ),
    _OnboardingData(
      image: 'assets/onboarding3.png', // Replace with your asset
      title: 'Not paylaş, kahven bizden olsun.',
      description:
          "Hiç bir emek karşılıksız kalmamalı, özellikle sabah 03:00 özetleri. 🥱",
      boldText: '',
      extraButton: true,
    ),
  ];

  Future<void> _setSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
  }

  Future<void> _onSkip() async {
    await _setSeenOnboarding();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  Future<void> _onKaydol() async {
    await _setSeenOnboarding();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  Future<void> _onGirisYap() async {
    await _setSeenOnboarding();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'WASP',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: _onSkip,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 0),
                    ),
                    child: const Text(
                      'Atla',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = _pages[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        // Central image/illustration
                        SizedBox(
                          height: 210,
                          child: Image.asset(
                            data.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Page indicator
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (dotIndex) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == dotIndex ? 12 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? AppColors.primaryTextColor
                                    : AppColors.thirdTextColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 36),
                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Description (with bolded part if any)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: data.boldText.isNotEmpty
                              ? RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 15.0,
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data.boldText + ' ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                          text: data.description
                                              .replaceFirst(data.boldText, '')),
                                    ],
                                  ),
                                )
                              : Text(
                                  data.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Lexend',
                                    fontSize: 15.0,
                                    color: AppColors.thirdTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 6.0),
                          child: Column(
                            children: [
                              // Kaydol button (Gradient)
                              GradientButton(
                                text: 'Kaydol',
                                onPressed: _onKaydol,
                                height: 45,
                                borderRadius: 50,
                                gradientColors: const [
                                  Color(0xFFFFC800),
                                  Color(0xFFFF9100)
                                ],
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 14),
                              // Giriş Yap button (Outlined)
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    side: const BorderSide(
                                        width: 1.5,
                                        color: AppColors.primaryTextColor),
                                  ),
                                  onPressed: _onGirisYap,
                                  child: const Text(
                                    'Giriş Yap',
                                    style: TextStyle(
                                      color: AppColors.primaryTextColor,
                                      fontFamily: 'Lexend',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingData {
  final String image;
  final String title;
  final String description;
  final String boldText;
  final bool extraButton;
  _OnboardingData({
    required this.image,
    required this.title,
    required this.description,
    this.boldText = '',
    this.extraButton = false,
  });
}
