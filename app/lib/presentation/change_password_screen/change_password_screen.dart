import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/app_bar/appbar_leading_image_one.dart';
import 'package:meyaa/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController vectorController = TextEditingController();

  TextEditingController vectorController1 = TextEditingController();

  TextEditingController vectorController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
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
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 55.v),
                      _buildArrowLeftStack(context),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 19.h, vertical: 30.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                    opacity: 0.8,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 8.h),
                                        child: Text("Current Password",
                                            style: CustomTextStyles
                                                .titleLargePoppinsPrimary))),
                                _buildVectorStack(context),
                                SizedBox(height: 21.v),
                                // _buildSetPasswordButton(context),
                                SizedBox(height: 5.v)
                              ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildArrowLeftStack(BuildContext context) {
    return SizedBox(
        height: 166.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomAppBar(
              height: 81.v,
              leadingWidth: 42.h,
              leading: AppbarLeadingImageOne(
                  imagePath: ImageConstant.imgArrowLeftWhiteA700,
                  margin: EdgeInsets.only(left: 16.h, top: 11.v, bottom: 40.v),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              centerTitle: true,
              title: AppbarSubtitleTwo(
                  text: "Change Password",
                  margin: EdgeInsets.only(top: 13.v, bottom: 37.v)),
              styleType: Style.bgFill),
          CustomImageView(
              imagePath: ImageConstant.imgOip2RemovebgPreview361x307,
              height: 118.v,
              width: 112.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 109.h))
        ]));
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 26.h),
        child: CustomTextFormField(
            width: 20.h,
            controller: vectorController,
            suffix: SizedBox(
                child: CustomImageView(
                    imagePath: ImageConstant.imgVectorBlueGray90019x20,
                    height: 19.v,
                    width: 20.h)),
            suffixConstraints: BoxConstraints(maxHeight: 19.v),
            obscureText: true,
            borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
            fillColor: appTheme.blueGray900));
  }

  /// Section Widget
  Widget _buildVector1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 26.h),
        child: CustomTextFormField(
            width: 20.h,
            controller: vectorController1,
            suffix: SizedBox(
                child: CustomImageView(
                    imagePath: ImageConstant.imgVectorBlueGray90019x20,
                    height: 19.v,
                    width: 20.h)),
            suffixConstraints: BoxConstraints(maxHeight: 19.v),
            obscureText: true,
            borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
            fillColor: appTheme.blueGray900));
  }

  /// Section Widget
  Widget _buildVector2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 26.h),
        child: CustomTextFormField(
            width: 20.h,
            controller: vectorController2,
            textInputAction: TextInputAction.done,
            suffix: SizedBox(
                child: CustomImageView(
                    imagePath: ImageConstant.imgVectorBlueGray90019x20,
                    height: 19.v,
                    width: 20.h)),
            suffixConstraints: BoxConstraints(maxHeight: 19.v),
            obscureText: true,
            borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
            fillColor: appTheme.blueGray900));
  }

  /// Section Widget
  Widget _buildVectorStack(BuildContext context) {
    return SizedBox(
        height: 340.v,
        width: 319.h,
        child: Stack(alignment: Alignment.centerLeft, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Opacity(
                  opacity: 0.8,
                  child: Padding(
                      padding: EdgeInsets.only(left: 25.h),
                      child: Text(".............",
                          style: theme.textTheme.displayLarge)))),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Opacity(
                                opacity: 0.8,
                                child: Text(".............",
                                    style: theme.textTheme.displayLarge))),
                        SizedBox(height: 3.v),
                        Opacity(
                            opacity: 0.8,
                            child: Text("Confirm Password",
                                style:
                                    CustomTextStyles.titleLargePoppinsPrimary))
                      ]))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Opacity(
                  opacity: 0.8,
                  child: Padding(
                      padding: EdgeInsets.only(left: 23.h),
                      child: Text(".............",
                          style: theme.textTheme.displayLarge)))),
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.h, vertical: 18.v),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                      image: DecorationImage(
                          image: fs.Svg(ImageConstant.imgGroup72),
                          fit: BoxFit.cover)),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 4.v),
                        _buildVector(context),
                        SizedBox(height: 26.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Opacity(
                                opacity: 0.8,
                                child: Text("New Password",
                                    style: CustomTextStyles
                                        .titleLargePoppinsPrimary))),
                        SizedBox(height: 32.v),
                        _buildVector1(context),
                        SizedBox(height: 112.v),
                        _buildVector2(context)
                      ])))
        ]));
  }

  /// Section Widget
  // Widget _buildSetPasswordButton(BuildContext context) {
  //   return CustomElevatedButton(
  //       height: 56.v,
  //       text: "Set Password",
  //       margin: EdgeInsets.only(left: 8.h, right: 20.h),
  //       buttonStyle: CustomButtonStyles.fillDeepPurpleA,
  //       buttonTextStyle: CustomTextStyles.headlineSmallPoppinsWhiteA700,
  //       onPressed: () {
  //         onTapSetPasswordButton(context);
  //       });
  // }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the myProfileScreen when the action is triggered.
  onTapSetPasswordButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myProfileScreen);
  }
}
