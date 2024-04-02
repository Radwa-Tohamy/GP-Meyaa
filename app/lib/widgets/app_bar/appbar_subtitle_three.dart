import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitleThree extends StatelessWidget {
  AppbarSubtitleThree({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumInter.copyWith(
            fontSize: 24.0.h,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
