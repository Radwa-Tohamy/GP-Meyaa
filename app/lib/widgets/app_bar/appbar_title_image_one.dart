import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitleImageOne extends StatelessWidget {
  AppbarTitleImageOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.roundedBorder35,
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 80.v,
          width: 71.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            35.h,
          ),
        ),
      ),
    );
  }
}
