import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {"title": "Welcome To Islami App", "image": "assets/images/Group.png"},
    {
      "title": "Welcome To Islami App",
      "description": "We Are Very Excited To Have You In Our Community",
      "image": "assets/images/Frame 3.png",
    },
    {
      "title": "Reading the Quran",
      "description": "Read, and your Lord is the Most Generous",
      "image": "assets/images/Frame 3555.png",
    },
    {
      "title": "Bearish",
      "description": "Praise the name of your Lord, the Most High",
      "image": "assets/images/jkdsfhlkjs.png",
    },
    {
      "title": "Holy Quran Radio",
      "description":
          "You can listen to the Holy Quran Radio through the application for free and easily",
      "image": "assets/images/jdhsglj.png",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('home');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacementNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PageView للصفحات
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              final data = _onboardingData[index];
              return OnboardingPage(
                title: data["title"] ?? "",
                description: data["description"] ?? "",
                imagePath: data["image"] ?? "",
              );
            },
          ),

          // شعار Islami في الأعلى
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                "assets/images/Group 31.png",
                height: 171,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر Skip أو Back
                  _currentPage == 0
                      ? TextButton(
                          onPressed: _skip,
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Color(0xFFB7935F),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: _previousPage,
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Color(0xFFB7935F),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFFB7935F)
                              : Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // زر Next أو Finish
                  TextButton(
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? "Finish"
                          : "Next",
                      style: const TextStyle(
                        color: Color(0xFFB7935F),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 171), // للشعار العلوي

          Expanded(
            child: Image.asset(imagePath, fit: BoxFit.contain, width: 291),
          ),

          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFB7935F),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          if (description.isNotEmpty)
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFB7935F),
                fontSize: 20,
                height: 1.6,
              ),
            ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
