import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'screens.dart';

class IntroPage extends StatelessWidget {
  final List<PageViewModel> _pages = [
    PageViewModel(
      title: "Find Favorite Items",
      body: 'Find your favorite products that you want to by easily.',
      image: const Center(
        child: Image(
          image: AssetImage('images/intro5.png'),
          fit: BoxFit.cover,
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.grey[200],
        imageFlex: 3,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        bodyTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    PageViewModel(
      title: "Easy and Save Payment",
      body: 'Pay for the products you buy safely and easily.',
      image: const Center(
        child: Image(
          image: AssetImage('images/intro2.png'),
          fit: BoxFit.cover,
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.grey[200],
        imageFlex: 3,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        bodyTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    PageViewModel(
      title: "Product Delivery",
      body: 'Your product is delivered to your home safely and securely.',
      image: const Center(
        child: Image(
          image: AssetImage('images/intro3.png'),
          fit: BoxFit.cover,
        ),
      ),
      decoration: PageDecoration(
        pageColor: Colors.grey[200],
        imageFlex: 3,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        bodyTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ];

  IntroPage({super.key});

  void onDone(context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.grey.shade200,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: IntroductionScreen(
            pages: _pages,
            globalBackgroundColor: Colors.grey.shade200,
            dotsDecorator: DotsDecorator(activeColor: Colors.green.shade900),
            showDoneButton: true,
            done: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
            showSkipButton: true,
            skip: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ),
            ),
            showNextButton: true,
            next: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onDone: () => onDone(context),
          ),
        ),
      ),
    );
  }
}
