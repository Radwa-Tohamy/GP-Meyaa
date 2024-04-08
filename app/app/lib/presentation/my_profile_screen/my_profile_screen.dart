import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  TextEditingController contactUsController = TextEditingController();

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
                        begin: Alignment(0.98, 0),
                        end: Alignment(0, 1),
                        colors: [appTheme.indigo40019, appTheme.indigo40019])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 41.v),
                    child: Column(children: [
                      _buildTopSection(context),
                      SizedBox(height: 9.v),
                      _buildUserRow(context),
                      SizedBox(height: 55.v),
                      Padding(
                          padding: EdgeInsets.only(left: 13.h, right: 23.h),
                          child: _buildEightyOne(context)),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.only(left: 13.h, right: 23.h),
                          child: _buildEightyOne(context)),
                      SizedBox(height: 27.v),
                      _buildChangePasswordRow(context),
                      SizedBox(height: 23.v),
                      Padding(
                          padding: EdgeInsets.only(left: 13.h, right: 23.h),
                          child: CustomTextFormField(
                              controller: contactUsController,
                              hintText: "Contact Us",
                              hintStyle:
                                  CustomTextStyles.titleLargeInterWhiteA700,
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      18.h, 8.v, 26.h, 11.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgHeadphone,
                                      height: 30.adaptSize,
                                      width: 30.adaptSize)),
                              prefixConstraints:
                                  BoxConstraints(maxHeight: 49.v),
                              contentPadding: EdgeInsets.only(
                                  top: 12.v, right: 30.h, bottom: 12.v),
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillPurple)),
                      SizedBox(height: 23.v),
                      _buildLogoutRow(context),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildTopSection(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapTopSection(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 6.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlinePrimary,
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgLefticon,
                  height: 24.v,
                  width: 40.h,
                  margin: EdgeInsets.symmetric(vertical: 1.v)),
              Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text("My Profile",
                      style: CustomTextStyles.titleLargeInterBluegray900))
            ])));
  }

  /// Section Widget
  Widget _buildUserRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgUserBlueGray900,
                  height: 75.adaptSize,
                  width: 75.adaptSize,
                  margin: EdgeInsets.only(top: 15.v)),
              Container(
                  width: 194.h,
                  margin: EdgeInsets.only(left: 15.h, top: 30.v, bottom: 7.v),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "User Name\n",
                            style:
                                CustomTextStyles.headlineSmallInterBluegray900),
                        TextSpan(
                            text: "username@gmail.com",
                            style:
                                CustomTextStyles.titleMediumInterBluegray90018)
                      ]),
                      textAlign: TextAlign.left)),
              CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup,
                  height: 53.v,
                  width: 25.h,
                  margin: EdgeInsets.only(left: 6.h, bottom: 37.v))
            ]));
  }

  /// Section Widget
  Widget _buildChangePasswordRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 13.h, right: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 8.v),
        decoration: AppDecoration.fillPurple
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgIconLock,
                  height: 30.v,
                  width: 26.h,
                  margin: EdgeInsets.only(bottom: 3.v)),
              Padding(
                  padding: EdgeInsets.only(left: 25.h, top: 4.v, bottom: 3.v),
                  child: Text("Change Password",
                      style: CustomTextStyles.titleLargeInterWhiteA700))
            ]));
  }

  /// Section Widget
  Widget _buildLogoutRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 13.h, right: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 9.v),
        decoration: AppDecoration.fillPurple
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgIconAlternate,
                  height: 30.v,
                  width: 39.h,
                  margin: EdgeInsets.only(top: 1.v)),
              Padding(
                  padding: EdgeInsets.only(left: 19.h, top: 1.v, bottom: 3.v),
                  child: Text("Log Out",
                      style: CustomTextStyles.titleLargeInterWhiteA700))
            ]));
  }

  /// Common widget
  Widget _buildEightyOne(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 7.v),
        decoration: AppDecoration.fillPurple
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          CustomImageView(
              imagePath: ImageConstant.imgQuestion,
              height: 32.v,
              width: 37.h,
              margin: EdgeInsets.only(top: 3.v)),
          Padding(
              padding: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 4.v),
              child: Text("Help",
                  style: CustomTextStyles.titleLargeInterWhiteA700))
        ]));
  }

  /// Navigates to the homepagelightScreen when the action is triggered.
  onTapTopSection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepagelightScreen);
  }
}
