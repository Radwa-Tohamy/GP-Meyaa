import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/welcome_screen/welcome_screen.dart';
import 'package:meyaa/widgets/app_bar/appbar_leading_image.dart';
import 'package:meyaa/widgets/app_bar/appbar_title.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_pin_code_text_field.dart';
import 'package:meyaa/theme/custom_text_style.dart';
import 'package:meyaa/services/api_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../responsive.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:meyaa/models/login_response_model.dart';

class VerficationScreen extends StatefulWidget {
  final String? email;
  final String? otpHash;

  const VerficationScreen({Key? key, this.email, this.otpHash})
      : super(
          key: key,
        );

  @override
  State<VerficationScreen> createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {
  FormFieldValidator<String>? emailValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
  };
  String otpCode = '';

  bool isAPIcallProcess = false;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, 0),
                end: Alignment(-0.21, 0.08),
                colors: [
                  appTheme.purple9003301,
                  appTheme.purple90033,
                  theme.colorScheme.secondaryContainer,
                ],
              ),
            ),
            child: Form(
              key: globalKey,
              child: SizedBox(
                width: 470.h,
                child: Column(
                  children: [
                    SizedBox(height: 5.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTwenty(context),
                            Container(
                              width: 400.h,
                              height: 657.v,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.h,
                                // vertical: 65.v,
                                vertical: 31.v,
                              ),
                              decoration: AppDecoration.outlinePurpleF.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      "OTP Verification",
                                      style: theme.textTheme.headlineLarge,
                                    ),
                                  ),
                                  // SizedBox(height: 28.v),
                                  SizedBox(height: 13.v),
                                  Container(
                                    width: 290.h,
                                    margin: EdgeInsets.only(right: 89.h),
                                    child: Text(
                                      "We sent you one time password on your \nemail address.\n Please enter the OTP.",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ),
                                  SizedBox(height: 9.v),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup25,
                                    height: 220.v,
                                    width: 250.h,
                                    margin: EdgeInsets.only(top: 10.h),
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(height: 10.v),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 30.h,
                                      right: 61.h,
                                    ),
                                    child: OTPTextField(
                                      length: 4,
                                      width: MediaQuery.of(context).size.width,
                                      fieldWidth: 55.v,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors
                                              .black), // black color for the numbers
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      fieldStyle: FieldStyle.underline,
                                      onChanged: (value) {
                                        setState(() {
                                          otpCode = value!;
                                        });
                                      },
                                      // onCompleted: (pin) {
                                      //   print("Completed: " + pin);
                                      // },
                                    ),
                                  ),
                                  SizedBox(height: 20.v),
                                  CustomElevatedButton(
                                    width: 220.adaptSize,
                                    text: "Submit",
                                    onPressed: () {
                                      if (ValidateAndSave()) {
                                        setState(() {
                                          isAPIcallProcess = true;
                                        });

                                        APIService.verifyOTP(widget.email!,
                                                widget.otpHash!, otpCode)
                                            .then(
                                          (response) {
                                            setState(() {
                                              isAPIcallProcess = false;
                                            });

                                            final loginResponse =
                                                loginResponseModel(
                                                    response.body);

                                            /////////////
                                            print(
                                                "Response Message: ${loginResponse.message}");
                                            if (loginResponse.message != null) {
                                              //Success Case
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: Text(
                                                      "Email Verification: ${loginResponse.message}"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);

                                                        // Only navigate if the response is "success"
                                                        if (loginResponse
                                                                .message ==
                                                            "success") {
                                                          Navigator.pushNamed(
                                                              context,
                                                              AppRoutes
                                                                  .welcomeScreen);
                                                        }
                                                      },
                                                      child: Text("OK"),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      }
                                      // Navigator.pushNamed(
                                      //     context, AppRoutes.welcomeScreen);
                                    },
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 32.h),
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumOutfit,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(height: 4.v),
                                ],
                              ),
                            ),
                          ],
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
    );
  }

  bool ValidateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /// Section Widget
  Widget _buildTwenty(BuildContext context) {
    return SizedBox(
      height: 140.v,
      width: 340.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgOip2RemovebgPreview,
            height: 160.adaptSize,
            width: 150.adaptSize,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: 30.h,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 120.h,
              margin: Responsive.isTablet(context)
                  ? EdgeInsets.only(bottom: 50.v, right: 60.h)
                  : EdgeInsets.only(
                      bottom: 50.v,
                    ),
              child: Text("MEYAA",
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  style: Responsive.isTablet(context)
                      ? Theme.of(context).textTheme.headline2!.copyWith(
                          color: appTheme.blueGray800,
                          fontWeight: FontWeight.bold)
                      : Theme.of(context).textTheme.headline5!.copyWith(
                          color: appTheme.blueGray800,
                          fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
