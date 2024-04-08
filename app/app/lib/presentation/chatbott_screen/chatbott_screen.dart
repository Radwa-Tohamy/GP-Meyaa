import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/app_bar/appbar_leading_image_one.dart';
// import 'package:meyaa/widgets/app_bar/appbar_leading_image_two.dart';
// import 'package:meyaa/widgets/app_bar/appbar_image.dart';
// import 'package:meyaa/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:meyaa/widgets/app_bar/appbar_subtitle_three.dart';
// import 'package:meyaa/widgets/app_bar/appbar_title_image.dart';
import 'package:meyaa/widgets/app_bar/appbar_trailing_edittext.dart';
// import 'package:meyaa/widgets/app_bar/appbar_subtitle_seven.dart';
import 'package:meyaa/widgets/app_bar/appbar_trailing_image.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';
import 'package:meyaa/theme/theme_helper.dart';
import 'package:meyaa/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore_for_file: must_be_immutable
class ChatbottScreen extends StatefulWidget {
  ChatbottScreen({Key? key}) : super(key: key);

  @override
  State<ChatbottScreen> createState() => _ChatbottScreenState();
}

class _ChatbottScreenState extends State<ChatbottScreen> {
  TextEditingController saveEditTextController = TextEditingController();

  TextEditingController outlineFilesCopyEditTextController =
      TextEditingController();
  TextEditingController playEditTextController = TextEditingController();
  var isDark = false;
  List<String> messages = []; // Add this list to store messages
  GlobalKey<FormFieldState<String>> playEditTextKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
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
                child: Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 13.h, vertical: 7.v),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Center(
                                  child: SingleChildScrollView(
                                    // Wrap the Stack with SingleChildScrollView
                                    child: SizedBox(
                                      height: 58.v,
                                      width: 255.h,
                                      child: SingleChildScrollView(
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: 700.h,
                                                  height: 58.v,
                                                  // width: screenWidth * 0.7,
                                                  margin: EdgeInsets.only(
                                                    right: 6.h,
                                                  ),
                                                  // padding: EdgeInsets.symmetric(
                                                  //   horizontal: 14.h,
                                                  //   vertical: 11.v,
                                                  // ),
                                                  decoration: AppDecoration
                                                      .fillBlueGray
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder12,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.h),
                                                    child: SwitchListTile(
                                                      inactiveThumbColor:
                                                          Color(0XFFA09E99),
                                                      activeColor:
                                                          Color(0XFFBC83E9),
                                                      title: AutoSizeText(
                                                        "Real Estate",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: CustomTextStyles
                                                            .titleLargeInter
                                                            .copyWith(
                                                          fontSize: 22.h,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Inter',
                                                        ),
                                                      ),
                                                      value:
                                                          isDark, // Set the initial value based on your logic
                                                      onChanged: (bool value) {
                                                        // Add your logic when the switch is toggled
                                                        setState(() {
                                                          isDark = value;
                                                        });
                                                      },
                                                      // Optional: Icon on the left side
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              _buildHelloIAmMeyaaRow(context),
                              SizedBox(height: 22.v),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 21.h, right: 39.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.h, vertical: 4.v),
                                    decoration: AppDecoration.fillPrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .customBorderBL15),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  width: 182.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 7.v),
                                                  child: Text(
                                                      "How can i help you today?",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .titleLargeInterWhiteA700))),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgOutlineFilesCopy,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                              margin: EdgeInsets.fromLTRB(
                                                  36.h, 6.v, 7.h, 30.v))
                                        ])),
                              ),
                              SizedBox(height: 25.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Container(
                                        width: 279.h,
                                        margin: EdgeInsets.only(
                                            left: 48.h, right: 7.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17.h, vertical: 10.v),
                                        decoration: AppDecoration.fillBlue
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL15),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 4.v),
                                              Container(
                                                width: 184.h,
                                                margin: EdgeInsets.only(
                                                    right: 60.h, top: 0.h),
                                                child: Text(
                                                    "Hey Meyaa! \nPlease, call Tasnim",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: CustomTextStyles
                                                        .titleLargeInterWhiteA700),
                                              ),
                                            ])),
                                  )),
                              SizedBox(height: 22.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(right: 51.h, top: 3.h),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgAiEssentialsIcon,
                                            height: 41.v,
                                            width: 42.h,
                                            margin:
                                                EdgeInsets.only(bottom: 7.v)),
                                        _buildOutlineFilesCopyEditText(context)
                                      ])),
                              Spacer(),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 39.h, right: 31.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _buildSaveButton(context),
                                            _buildRefreshButton(context)
                                          ]))),
                              _buildPlayEditText(context),
                              SizedBox(height: 12.v)
                            ]),
                      )),
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 105.v,
      leadingWidth: 26.h,
      leading: Padding(
        padding: EdgeInsets.only(top: 23.h),
        child: AppbarLeadingImageOne(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 18.h, top: 5.v, bottom: 38.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: AppbarSubtitleThree(
          text: "Chatbott",
          margin: EdgeInsets.only(left: 18.h, bottom: 40.v),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHelloIAmMeyaaButton(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 41.v,
            text: "Hello! I am Meyaa.",
            margin: EdgeInsets.only(left: 6.h),
            rightIcon: Container(
                margin: EdgeInsets.only(
                  left: Responsive.isTablet(context)
                      ? 90.h * MediaQuery.of(context).textScaleFactor
                      : Responsive.isMobileLarge(context)
                          ? 32.h * MediaQuery.of(context).textScaleFactor
                          : 52.h * MediaQuery.of(context).textScaleFactor,
                ),
                child: CustomImageView(
                    imagePath: ImageConstant.imgOutlineFilesCopy,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleLargeInterWhiteA700));
  }

  /// Section Widget
  Widget _buildHelloIAmMeyaaRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 45.h, top: 5.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgAiEssentialsIcon,
              height: 41.v,
              width: 42.h),
          _buildHelloIAmMeyaaButton(context)
        ]));
  }

  /// Section Widget
  Widget _buildOutlineFilesCopyEditText(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomTextFormField(
                controller: outlineFilesCopyEditTextController,
                hintText: "Calling....",
                hintStyle: CustomTextStyles.titleLargeInterWhiteA700,
                suffix: Container(
                    margin: EdgeInsets.fromLTRB(6.h, 12.v, 22.h, 11.v),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgOutlineFilesCopy,
                        height: 24.adaptSize,
                        width: 24.adaptSize)),
                suffixConstraints: BoxConstraints(maxHeight: 47.v),
                contentPadding:
                    EdgeInsets.only(left: 13.h, top: 11.v, bottom: 11.v),
                borderDecoration: TextFormFieldStyleHelper.fillPrimary,
                fillColor: theme.colorScheme.primary.withOpacity(1))));
  }

  // Section Widget
  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
        height: 38.v,
        width: 93.h,
        text: "Save",
        margin: EdgeInsets.only(bottom: 10.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 9.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgRectangle99Stroke,
                height: 20.v,
                width: 18.h)),
        buttonStyle: CustomButtonStyles.fillGrayAd,
        buttonTextStyle: CustomTextStyles.titleMediumInter);
  }

  /// Section Widget
  Widget _buildRefreshButton(BuildContext context) {
    return CustomElevatedButton(
        height: 38.v,
        width: 100.h,
        text: "Refresh",
        margin: EdgeInsets.only(left: 20.h, bottom: 10.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorWhiteA70018x18,
                height: 18.adaptSize,
                width: 18.adaptSize)),
        buttonStyle: CustomButtonStyles.fillGrayAd,
        buttonTextStyle: CustomTextStyles.titleMediumInter);
  }

  /// Section Widget
  Widget _buildPlayEditText(BuildContext context) {
    return Column(
      children: [
        // Display the messages

        for (String message in messages)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(message),
          ),

        Padding(
          padding: EdgeInsets.only(left: 6.h, right: 3.h),
          child: CustomTextFormField(
            key: playEditTextKey,
            controller: playEditTextController,
            hintText: "Say Something.......",
            hintStyle: CustomTextStyles.titleMediumInterGray100.copyWith(
              color: Color(0xFFF5F5F5),
            ),
            textInputAction: TextInputAction.done,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Perform action when the audio icon is clicked

                    print("Audio icon clicked");
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30.h, 9.v, 2.h, 13.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgAudio,
                      height: 30.v,
                      width: 18.h,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(width: 6.h),
                GestureDetector(
                  onTap: () {
                    // Perform action when the play icon is clicked

                    print("Play icon clicked");

                    // Add your logic to send the message here

                    if (playEditTextController.text.isNotEmpty) {
                      // Send the message

                      print("Sending message: ${playEditTextController.text}");

                      setState(() {
                        // Update the state to trigger a rebuild

                        messages.add(playEditTextController.text);

                        playEditTextController.clear(); // Clear the text field
                      });
                    }
                  },
                  child: CustomImageView(
                    margin: EdgeInsets.only(right: 7.h),
                    imagePath: ImageConstant.imgPlay,
                    height: 21.v,
                    width: 20.h,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            suffixConstraints: BoxConstraints(maxHeight: 49.v),
            contentPadding:
                EdgeInsets.only(left: 15.h, top: 14.v, bottom: 14.v),
            borderDecoration: TextFormFieldStyleHelper.fillGrayAd,
            fillColor: appTheme.gray600Ad,
          ),
        ),
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
