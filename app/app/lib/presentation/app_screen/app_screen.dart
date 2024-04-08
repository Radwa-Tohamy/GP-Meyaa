import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/chatbott_screen/chatbott_screen.dart';
import 'package:meyaa/presentation/mobile_login_screen/mobile_login_screen.dart';
import 'package:meyaa/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:meyaa/presentation/welcome_screen/welcome_screen.dart';
import 'package:meyaa/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:meyaa/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:meyaa/presentation/welcome_screen/welcome_screen.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => mobile_login_screen()),
      );
    });
    Size _size = MediaQuery.of(context).size;
    print(_size.width);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Expanded(
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(1),
                width: 1.h,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.onSecondaryContainer,
                  theme.colorScheme.onSecondaryContainer,
                  appTheme.purple80000,
                  // theme.colorScheme.onSecondaryContainer,
                  // appTheme.purple20001,

                  // appTheme.purple80000,

                  // appTheme.deepPurpleA100001,
                  // appTheme.blue800,
                  // appTheme.PurplePassion,
                  // appTheme.gray100,
                  // appTheme.DarkInk,
                  // appTheme.purple80000,
                  // appTheme.MidnightLavender
                ],
              ),
            ),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 26.h,
                vertical: 168.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgOip2RemovebgPreview,
                    height: 308.adaptSize,
                    width: 294.adaptSize,
                    radius: BorderRadius.circular(
                      3.h,
                    ),
                  ),
                  SizedBox(height: 44.v),
                  Container(
                    decoration: AppDecoration.outlinePrimary,
                    child: AutoSizeText(
                      "MEYAA",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.interGray100
                          .copyWith(fontSize: 85.adaptSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
