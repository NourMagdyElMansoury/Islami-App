import 'package:flutter/material.dart';

extension AppTheme on BuildContext{
  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => appTheme.textTheme;
}