import 'package:flutter/material.dart';
import 'package:catfacts/views/catfacts.dart';
import 'package:lottie/lottie.dart';

class CatFactsSplashScreen extends StatefulWidget {
  const CatFactsSplashScreen({Key? key}) : super(key: key);

  @override
  State<CatFactsSplashScreen> createState() => _CatFactsSplashScreenState();
}

class _CatFactsSplashScreenState extends State<CatFactsSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CatFactsHomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 3,
            ),
            RotationTransition(
              turns: const AlwaysStoppedAnimation(-8 / 360),
              child: Image.asset(
                "assets/images/catfact.png",
                width: MediaQuery.of(context).size.width * .09,
                height: MediaQuery.of(context).size.height * .09,
              ),
            ),
            const Spacer(),
            Lottie.asset('assets/images/14476-rainbow-cat-remix.json'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
