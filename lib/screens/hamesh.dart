import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: OnboardingScreen(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   // للتحكم في الصفحات
//   final PageController _pageController = PageController();
//   int _currentPage = 0;

//   // بيانات الصفحات (الصور والنصوص)
//   final List<Map<String, String>> pages = [
//     {
//       "image": "assets/images/Group.png",
//       "title": "Welcome To Islami App",
//     },
//     {
//       "image": "assets/images/Frame 3.png",
//       "title": "Welcome To Islami App",
//       "description": "We Are Very Excited To Have You In Our Community",
//     },
//     {
//       "image": "assets/images/Frame 3555.png",
//       "title": "Reading the Quran",
//       "description": "Read, and your Lord is the Most Generous",
//     },
//     {
//       "image": "assets/images/jkdsfhlkjs.png",
//       "title": "Bearish",
//       "description": "Praise the name of your Lord, the Most High",
//     },
//     {
//       "image": "assets/images/jdhsglj.png",
//       "title": "Holy Quran Radio",
//       "description":
//           "You can listen to the Holy Quran Radio through the application for free and easily",
//     },
//   ];

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // قفل الشاشة على الوضع الرأسي فقط
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // الصفحات المتحركة (الصور + النصوص)
//           PageView.builder(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             itemCount: pages.length,
//             itemBuilder: (context, index) {
//               return buildPageContent(pages[index]);
//             },
//           ),

//           // الشعار في الأعلى (ثابت في كل الصفحات)
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               "assets/images/Group 31.png",
//               height: 171,
//               fit: BoxFit.fitWidth,
//             ),
//           ),

//           // الأزرار والنقاط في أسفل الشاشة تمامًا
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.transparent,
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // زر Skip أو Back
//                   TextButton(
//                     onPressed: () {
//                       if (_currentPage == 0) {
//                         // Skip ينتقل مباشرة للصفحة الرئيسية
//                         Navigator.pushReplacementNamed(context, '/home');
//                       } else {
//                         // Back يرجع للصفحة السابقة
//                         _pageController.previousPage(
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       }
//                     },
//                     child: Text(
//                       _currentPage == 0 ? "Skip" : "Back",
//                       style: const TextStyle(
//                         color: Color(0xFFB7935F),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),

//                   // النقاط الدائرية في المنتصف
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: List.generate(
//                       pages.length,
//                       (index) {
//                         return Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           height: 8,
//                           width: _currentPage == index ? 24 : 8,
//                           decoration: BoxDecoration(
//                             color: _currentPage == index
//                                 ? const Color(0xFFB7935F)
//                                 : Colors.grey.withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   // زر Next أو Finish
//                   TextButton(
//                     onPressed: () {
//                       if (_currentPage < pages.length - 1) {
//                         // الانتقال للصفحة التالية
//                         _pageController.nextPage(
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.easeInOut,
//                         );
//                       } else {
//                         // الصفحة الأخيرة → الانتقال للشاشة الرئيسية
//                         Navigator.pushReplacementNamed(context, '/home');
//                       }
//                     },
//                     child: Text(
//                       _currentPage == pages.length - 1 ? "Finish" : "Next",
//                       style: const TextStyle(
//                         color: Color(0xFFB7935F),
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // دالة بسيطة لبناء محتوى كل صفحة (سهلة الفهم للمبتدئين)
//   Widget buildPageContent(Map<String, String> page) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       child: Column(
//         children: [
//           // مسافة لتجنب التداخل مع الشعار العلوي
//           const SizedBox(height: 171),

//           // الصورة الرئيسية
//           Expanded(
//             child: Image.asset(
//               page["image"]!,
//               fit: BoxFit.contain,
//             ),
//           ),

//           const SizedBox(height: 40),

//           // العنوان
//           Text(
//             page["title"]!,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: Color(0xFFB7935F),
//               fontSize: 26,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           const SizedBox(height: 20),

//           // الوصف (يظهر فقط إذا كان موجودًا)
//           if (page.containsKey("description") && page["description"]!.isNotEmpty)
//             Text(
//               page["description"]!,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 height: 1.6,
//               ),
//             ),

//           // مسافة سفلية لتجنب التداخل مع الأزرار
//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }
// }
