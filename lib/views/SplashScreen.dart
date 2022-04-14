import 'package:flutter/material.dart';
import 'package:catfacts/views/catfacts.dart';

class CatFactsSplashScreen extends StatelessWidget {
  const CatFactsSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CatFactsHomeScreen(),
        ),
      );
    });
    return SafeArea(
      child: Image.asset(
        "assets/images/bg.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
