//import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/chatbott_screen/chatbott_screen.dart';
import 'package:meyaa/responsive.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:meyaa/presentation/access_message_screen/access_message_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // mediaQueryData = MediaQuery.of(context);
    // Future.delayed(Duration(seconds: 1), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => ChatbottScreen()),
    //   );
    // });
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, 0),
                        end: Alignment(-0.21, 0.08),
                        colors: [
                      // appTheme.no2,
                      // appTheme.no2,
                      // appTheme.no3,
                      // appTheme.indigo4001901,
                      appTheme.purple9003301,
                      appTheme.purple90033,
                      theme.colorScheme.secondaryContainer,
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgOip2RemovebgPreview361x307,
                                height: 361.fSize,
                                width: 307.fSize,
                                alignment: Alignment.center),
                            SizedBox(height: 29.v),
                            AutoSizeText(
                              " Get your Question’s Answer",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.headlineSmallInterPrimary
                                  .copyWith(
                                fontSize: Responsive.isTablet(context)
                                    ? 45.0 *
                                        MediaQuery.of(context).textScaleFactor
                                    : (Responsive.isMobileLarge(context)
                                        ? 30.0 *
                                            MediaQuery.of(context)
                                                .textScaleFactor
                                        : 25.0 *
                                            MediaQuery.of(context)
                                                .textScaleFactor),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 24.v),
                            Center(
                              child: Container(
                                width: 277.h,
                                child: Center(
                                  child: AutoSizeText(
                                    "Get answers to all your questions in \nboth Personal and Real estate fields\n                         with Meyaa.",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .titleMediumInterPrimary_1
                                        .copyWith(
                                      fontSize: Responsive.isTablet(context)
                                          ? 32.0 *
                                              MediaQuery.of(context)
                                                  .textScaleFactor
                                          : (Responsive.isMobileLarge(context)
                                              ? 25.0 *
                                                  MediaQuery.of(context)
                                                      .textScaleFactor
                                              : 16.0 *
                                                  MediaQuery.of(context)
                                                      .textScaleFactor),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 22.v),
                            CustomElevatedButton(
                              height: 55.v,
                              width: 340.h,
                              text: "Get Started",
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL10,
                              buttonTextStyle: CustomTextStyles
                                  .headlineSmallInterPrimarySemiBold
                                  .copyWith(
                                fontSize: Responsive.isTablet(context)
                                    ? 45.0 *
                                        MediaQuery.of(context).textScaleFactor
                                    : (Responsive.isMobileLarge(context)
                                        ? 27.0 *
                                            MediaQuery.of(context)
                                                .textScaleFactor
                                        : 25.0 *
                                            MediaQuery.of(context)
                                                .textScaleFactor),
                                fontWeight: FontWeight.w600,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomPopup();
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 5.v),
                          ]),
                    )))));
  }

  /// Navigates to the accessMessageScreen when the action is triggered.
}
