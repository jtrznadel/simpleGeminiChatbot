import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
