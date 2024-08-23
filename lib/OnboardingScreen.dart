import 'package:flutter/material.dart';

late final PageController _pageController = PageController();

int _currentPage = 0;

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff221F1E),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  SamplePageView(imagePath: "assets/image1.jpg"),
                  SamplePageView(imagePath: "assets/image2.jpg"),
                  SamplePageView(imagePath: "assets/image3.jpg"),
                  SamplePageView(imagePath: "assets/image4.jpg"),
                ],
              ),
            ),
            const CustomButton()
          ],
        ));
  }
}

class SamplePageView extends StatelessWidget {
  const SamplePageView({
    super.key,
    required this.imagePath,
  });

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width *
              0.85, // 50% of the screen width
          height: MediaQuery.of(context).size.height *
              0.45, // 30% of the screen height
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        const Text(
          "Boost Productivity",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "Gilrey"),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          textAlign: TextAlign.center,
          "Boost Productivity\nand get more done in less time.",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontFamily: "Gilroy Pro"),
        ),
        const SizedBox(
          height: 55,
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 65.0),
      child: GestureDetector(
        onTap: () {
          if (_currentPage < 3) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            _currentPage++;
          } else {
            Navigator.of(context).pushReplacementNamed('home');
            _pageController.animateToPage(4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCirc);
          }
        },
        child: Container(
          width: 115,
          height: 55,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromARGB(255, 255, 94, 0)),
          child: const Center(
              child: Text("Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Gilroy"))),
        ),
      ),
    );
  }
}
