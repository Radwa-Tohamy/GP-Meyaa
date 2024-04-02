import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {Key? key,
      required this.mobileLarge,
      required this.mobile,
      // required this.desktop,
      required this.tablet})
      : super(key: key);

  final Widget tablet;
  final Widget mobileLarge;
  final Widget mobile;

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700;
  }

  static bool isMobileLarge(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 450;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 700) {
      return tablet;
    } else if (_size.width > 450 && _size.width < 700) {
      return mobileLarge;
    } else {
      return mobile;
    }
  }
}
