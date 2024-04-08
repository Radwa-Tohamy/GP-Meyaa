import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/app_bar/appbar_leading_image_one.dart';
import 'package:meyaa/widgets/app_bar/appbar_subtitle.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: Form(
                    key: _formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Column(children: [
                          SizedBox(height: 55.v),
                          _buildArrowLeftStack(context),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 19.h, vertical: 42.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Username",
                                        style:
                                            CustomTextStyles.titleLargePoppins),
                                    SizedBox(height: 10.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.h),
                                        child: CustomTextFormField(
                                            controller: userNameController,
                                            hintText: "user name",
                                            hintStyle: CustomTextStyles
                                                .bodyMediumPoppinsWhiteA700)),
                                    SizedBox(height: 11.v),
                                    Text("Phone Number",
                                        style:
                                            CustomTextStyles.titleLargePoppins),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 6.h),
                                        child: CustomTextFormField(
                                            controller: phoneNumberController,
                                            hintText: "+20 1*********",
                                            hintStyle: CustomTextStyles
                                                .bodyMediumPoppinsWhiteA700,
                                            textInputAction:
                                                TextInputAction.done)),
                                    SizedBox(height: 25.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 3.h),
                                        child: Text("Profile Image",
                                            style: CustomTextStyles
                                                .titleLargePoppins)),
                                    SizedBox(height: 22.v),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgUserPrimary,
                                        height: 75.adaptSize,
                                        width: 75.adaptSize,
                                        margin: EdgeInsets.only(left: 20.h)),
                                    SizedBox(height: 41.v),
                                    // CustomElevatedButton(
                                    //     height: 56.v,
                                    //     text: "Update",
                                    //     margin: EdgeInsets.only(
                                    //         left: 11.h, right: 17.h),
                                    //     buttonStyle:
                                    //         CustomButtonStyles.fillDeepPurpleA,
                                    //     buttonTextStyle: CustomTextStyles
                                    //         .headlineSmallPoppins,
                                    //     onPressed: () {
                                    //       onTapUpdate(context);
                                    //     },
                                    //     alignment: Alignment.center),
                                    SizedBox(height: 5.v)
                                  ]))
                        ]))))));
  }

  /// Section Widget
  Widget _buildArrowLeftStack(BuildContext context) {
    return SizedBox(
        height: 166.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomAppBar(
              height: 81.v,
              leadingWidth: 43.h,
              leading: AppbarLeadingImageOne(
                  imagePath: ImageConstant.imgArrowLeftWhiteA700,
                  margin: EdgeInsets.only(left: 17.h, top: 17.v, bottom: 34.v),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              title: AppbarSubtitle(
                  text: "Edit Profile", margin: EdgeInsets.only(left: 14.h)),
              styleType: Style.bgFill),
          CustomImageView(
              imagePath: ImageConstant.imgOip2RemovebgPreview361x307,
              height: 118.v,
              width: 112.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 109.h))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the settingScreen when the action is triggered.
  onTapUpdate(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingScreen);
  }
}
