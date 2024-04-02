import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/app_bar/appbar_leading_image_one.dart';
import 'package:meyaa/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:meyaa/widgets/app_bar/appbar_title_image.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: _buildAppBar(context),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, 0),
                        end: Alignment(-0.21, 0.08),
                        colors: [
                      appTheme.purple9003301,
                      appTheme.purple90033,
                      theme.colorScheme.secondaryContainer
                    ])),
                child: Container(
                    width: 359.h,
                    margin: EdgeInsets.only(top: 21.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
                    decoration: AppDecoration.outlinePurple90001,
               
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgUserBlueGray900,
                                    height: 45.v,
                                    width: 46.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 11.h, top: 7.v, bottom: 6.v),
                                    child: Text("User Name",
                                        style: CustomTextStyles
                                            .headlineSmallInterBluegray900_1))
                              ]))),
                      SizedBox(height: 21.v),
                      Divider(indent: 5.h, endIndent: 2.h),
                      SizedBox(height: 27.v),
                      _buildAccountsSettings(context),
                      SizedBox(height: 19.v),
                      Divider(),
                      SizedBox(height: 20.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text("More",
                                  style: CustomTextStyles
                                      .titleLargeRubikRegular))),
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h, right: 30.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtAboutApp(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 2.v),
                                        child: Text("About App",
                                            style: CustomTextStyles
                                                .headlineSmallPrimary))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgForward,
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    margin: EdgeInsets.only(bottom: 2.v),
                                    onTap: () {
                                      onTapImgForward1(context);
                                    })
                              ])),
                      SizedBox(height: 18.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 29.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 6.v),
                                    child: Text("Privacy Policy",
                                        style: CustomTextStyles
                                            .headlineSmallPrimary)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgForward,
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    margin: EdgeInsets.only(top: 6.v))
                              ])),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h, right: 33.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtPermissions(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.v),
                                        child: Text("Permissions",
                                            style: CustomTextStyles
                                                .headlineSmallPrimary))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgForward,
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    margin: EdgeInsets.only(top: 12.v),
                                    onTap: () {
                                      onTapImgForward2(context);
                                    })
                              ])),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 109.v,
        leadingWidth: 41.h,
        leading: AppbarLeadingImageOne(
            imagePath: ImageConstant.imgLefticonPrimary,
            margin: EdgeInsets.only(left: 1.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapLeftIcon(context);
            }),
        title: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Row(children: [
              AppbarTitleImage(
                  imagePath: ImageConstant.imgSettingsBlueGray900,
                  margin: EdgeInsets.only(bottom: 2.v)),
              AppbarSubtitleOne(
                  text: "Settings",
                  margin: EdgeInsets.only(left: 16.h, top: 8.v))
            ])));
  }

  /// Section Widget
  Widget _buildAccountsSettings(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 30.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Accounts Settings\n",
                                  style: CustomTextStyles.titleLargeRubik),
                              TextSpan(
                                  text: "\n",
                                  style: CustomTextStyles
                                      .headlineSmallPrimaryRegular)
                            ]),
                            textAlign: TextAlign.left),
                        SizedBox(height: 18.v),
                        GestureDetector(
                            onTap: () {
                              onTapTxtEditProfileDark(context);
                            },
                            child: Container(
                                width: 125.h,
                                margin: EdgeInsets.only(left: 3.h),
                                child: Text("Edit Profile\n\nDark Mode",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyles.headlineSmallPrimary)))
                      ])),
              Padding(
                  padding: EdgeInsets.only(top: 58.v),
                  child: Column(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgForward,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 4.h),
                        onTap: () {
                          onTapImgForward(context);
                        }),
                    SizedBox(height: 21.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgMaskGroup60x60,
                        height: 60.adaptSize,
                        width: 60.adaptSize)
                  ]))
            ]));
  }

  /// Navigates to the myProfileScreen when the action is triggered.
  onTapLeftIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myProfileScreen);
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapTxtEditProfileDark(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editProfileScreen);
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapImgForward(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editProfileScreen);
  }

  /// Navigates to the aboutAppScreen when the action is triggered.
  onTapTxtAboutApp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aboutAppScreen);
  }

  /// Navigates to the aboutAppScreen when the action is triggered.
  onTapImgForward1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aboutAppScreen);
  }

  /// Navigates to the androidLargeTwoScreen when the action is triggered.
  onTapTxtPermissions(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.androidLargeTwoScreen);
  }

  /// Navigates to the androidLargeTwoScreen when the action is triggered.
  onTapImgForward2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.androidLargeTwoScreen);
  }
}
