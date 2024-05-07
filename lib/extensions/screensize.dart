import 'package:flutter/material.dart';

extension screensize on BuildContext {
  double Height(percentage) {
    return MediaQuery.of(this).size.height * percentage;
  }

  double Width(percentage) {
    return MediaQuery.of(this).size.width * percentage;
  }
}
