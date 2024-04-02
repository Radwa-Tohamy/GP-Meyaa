import 'package:flutter/gestures.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/verfication_screen/verfication_screen.dart';
import 'package:meyaa/services/api_service.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter/material.dart';

import '../../responsive.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  FormFieldValidator<String>? emailValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  };
  String email = '';

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
                            _buildVirtualAssistantStack(context),
                            Container(
                              width: 400.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.h,
                                vertical: 65.v,
                              ),
                              decoration: AppDecoration.outlinePurpleF.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      "Forgot Password",
                                      style: theme.textTheme.headlineLarge,
                                    ),
                                  ),
                                  SizedBox(height: 13.v),
                                  Container(
                                    width: 299.h,
                                    margin: EdgeInsets.only(right: 64.h),
                                    child: Text(
                                      "Hello, Dear ! \nPlease enter your email address below to receive one time password.",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles.bodyMedium13,
                                    ),
                                  ),
                                  SizedBox(height: 4.v),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgUndrawSecureLoginPdn4,
                                    height: 200.v,
                                    width: 300.h,
                                  ),
                                  SizedBox(height: 8.v),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 1.h, top: 30.v),
                                    child: Text(
                                      "Enter Your Email Address",
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 1.h,
                                      right: 3.h,
                                    ),
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'Enter your email',
                                        prefixIcon: Icon(Icons.email),
                                        border: TextFormFieldStyleHelper
                                            .outlineOnErrorTL6,
                                        hintStyle: theme.textTheme.bodyMedium,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 15.0),
                                        filled: true,
                                        fillColor: theme
                                            .colorScheme.onPrimaryContainer,
                                      ),
                                      style: TextStyle(color: Colors.black),
                                      validator: emailValidator,
                                      onSaved: (value) {
                                        email = value!;
                                      },
                                    ),

                                    // child: CustomTextFormField(
                                    //   context,
                                    //   "email",
                                    //   "",
                                    //   (onValidateVal) {
                                    //     if (onValidateVal.isEmpty) {
                                    //       return 'Required';
                                    //     }
                                    //   },
                                    //   (onSaved) {
                                    //     email = onSaved;
                                    //   },
                                    //   controller: emailController,
                                    //   hintText: "example123@gmail.com",
                                    //   hintStyle: theme.textTheme.bodyMedium!,
                                    //   textInputAction: TextInputAction.done,
                                    //   textInputType: TextInputType.emailAddress,
                                    //   alignment: Alignment.centerRight,
                                    //   borderDecoration: TextFormFieldStyleHelper
                                    //       .outlineOnErrorTL6,
                                    //   fillColor:
                                    //       theme.colorScheme.onPrimaryContainer,
                                    // ),
                                  ),
                                  SizedBox(height: 37.v),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      if (ValidateAndSave()) {
                                        setState(() {
                                          isAPIcallProcess = true;
                                        });
                                        print(email);
                                        APIService.otpLogin(email).then(
                                          (response) {
                                            setState(() {
                                              isAPIcallProcess = false; ////
                                            });
                                            if (response.data != null) {
                                              print(
                                                  "Response Data: ${response.data}");

                                              //OTPVerificationpage
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      VerficationScreen(
                                                    otpHash: response.data,
                                                    email: email,
                                                  ),
                                                ),
                                                (route) => false,
                                              );
                                            }
                                          },
                                        );
                                      }

                                      // Navigator.pushNamed(context,
                                      //     AppRoutes.verficationScreen); ////
                                    },
                                    width: 220.adaptSize,
                                    text: "Send OTP",
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 32.h),
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumOutfit,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(height: 71.v),
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
  Widget _buildVirtualAssistantStack(BuildContext context) {
    return SizedBox(
      height: 140.v,
      width: 347.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgOip2RemovebgPreview,
            height: 160.adaptSize,
            width: 150.adaptSize,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30.h),
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
