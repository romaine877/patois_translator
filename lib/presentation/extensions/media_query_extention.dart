import 'package:flutter/material.dart';

extension MediaQueryExtention on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get height =>
      MediaQuery.of(this).size.height -
      (MediaQuery.of(this).padding.top + kToolbarHeight);
  double get width => MediaQuery.of(this).size.width;
  double get heightPercentage => MediaQuery.of(this).size.height / 100;
  double get widthPercentage => MediaQuery.of(this).size.width / 100;
  double heightPercentageOf(double percentage) =>
      MediaQuery.of(this).size.height * percentage / 100;
  double widthPercentageOf(double percentage) =>
      MediaQuery.of(this).size.width * percentage / 100;
}
