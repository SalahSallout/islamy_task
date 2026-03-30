import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  static const routeName = "Sebha";

  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  int index = 0;
  double angle = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  void onSebhaClick() {
    setState(() {
      counter++;
      angle += 0.2;

      if (counter % 33 == 0) {
        index = (index + 1) % azkar.length;
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/images/Logo.png"), //
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onSebhaClick,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/sebha.png",
                      width: 300,
                      height: 300,
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        azkar[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "$counter",
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
