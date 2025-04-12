import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ayat/presention/customs/custom_text.dart';
import '../resorces/routes_manager.dart';
import '../resorces/string_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 2700), _goNext);
  }
  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 150,
              child: Lottie.asset(AppStrings.logoPath,),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomText(name: AppStrings.nameAppAyat,fontFa: "Cairo",alignmentGeometry: Alignment.center,color: Color(0xff747474), fontWeight: FontWeight.w900, font: 28),
            ),
          ],
        ),
      ),
    );
  }
}
