import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation{
  final String animationAsset; // Path to the Lottie animation file

  LottieAnimation({required this.animationAsset});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        animationAsset,
        width: 200, // Adjust the width as needed
        height: 200, // Adjust the height as needed
        fit: BoxFit.contain,
      ),
    );
  }
}
