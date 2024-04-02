// import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:meyaa/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_image_view.dart';
import 'package:meyaa/widgets/custom_icon_button.dart';
import 'package:meyaa/widgets/custom_switch.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meyaa/responsive.dart';
import 'package:meyaa/theme/theme_helper.dart';
import 'package:meyaa/services/firebase_auth_methods.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mobile_login_screen extends StatefulWidget {
  mobile_login_screen({Key? key})
      : super(
          key: key,
        );
  @override
  _EmailPasswordLoginState createState() => _EmailPasswordLoginState();
}

// class _EmailPasswordLoginState extends State<mobile_login_screen> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//     void loginUser() {
//     context.read<FirebaseAuthMethods>().loginWithEmail(
//           email: emailController.text,
//           password: passwordController.text,
//           context: context,
//         );
//   }

//  bool isSelectedSwitch = false;

// }

class _EmailPasswordLoginState extends State<mobile_login_screen> {
  bool _obscureTextPass = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSelectedSwitch = false;
  bool _isRemembered = false;

  void loginUser() async {
    firebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
    if (_isRemembered) {
      // Save credentials securely using SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
    } else {
      // Clear existing credentials if switch is off
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');
      await prefs.remove('password');
    }
  }

  String? EmailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w]{2,4}').hasMatch(value!)) {
      return " Email Format 'example22@mail.com'"; // Input is valid
    } else {
      return null;
    }
  }
@override
void initState() {
  super.initState();
  _initializeFormFields();
}

void _initializeFormFields() async {
  final prefs = await SharedPreferences.getInstance();
  emailController.text = prefs.getString('email') ?? '';
  passwordController.text = prefs.getString('password') ?? '';
}
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
                theme.colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: Form(
            key: _formKey,
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
                          _buildLoginStack(context),
                          Container(
                            width: 400.h,
                            height: 770.v,
                            padding: EdgeInsets.symmetric(
                              horizontal: 19.h,
                              vertical: 25.v,
                            ),
                            decoration: AppDecoration.outlinePurpleF.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL40,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 80.h),
                                    child: Text("Welcome back !",
                                        style: Responsive.isTablet(context)
                                            ? Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold)
                                            : Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                  ),
                                ),
                                SizedBox(height: 10.v),
                                _buildWelcomeStack(context),
                                SizedBox(height: 28.v),
                                CustomElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      loginUser(); // Corrected function call
                                      // Optionally, handle what happens after the user signs up
                                      // For example, you can navigate to a new screen or show a success message
                                    }
                                  },
                                  text: "Sign In",
                                  margin: EdgeInsets.only(
                                    left: 26.h,
                                    right: 36.h,
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                _buildLoginRow(context),
                                SizedBox(height: 13.v),
                                _buildSocialMediaRow(context),
                                SizedBox(height: 19.v),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Responsive.isTablet(context)
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              right: 170.adaptSize,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "Don’t have an account? ",
                                                      style: CustomTextStyles
                                                          .titleMediumRobotoMedium),
                                                  TextSpan(
                                                    text: "SignUp ",
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SignUpScreen()),
                                                            );
                                                          },
                                                    style: CustomTextStyles
                                                        .titleMediumRobotoMedium,
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        : Padding(
                                            padding:
                                                EdgeInsets.only(right: 90.h),
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "Don’t have an account? ",
                                                      style: CustomTextStyles
                                                          .titleMediumRobotoMedium),
                                                  TextSpan(
                                                    text: "SignUp ",
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SignUpScreen()),
                                                            );
                                                          },
                                                    style: CustomTextStyles
                                                        .titleMediumRobotoMedium,
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          )),
                                SizedBox(height: 15.v),
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
    );
  }

  /// Section Widget
  Widget _buildLoginStack(BuildContext context) {
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
            // 181.adaptSize,
            margin: EdgeInsets.only(left: 30.h),
            alignment: Alignment.centerLeft,
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

  /// Section Widget
  Widget _buildWelcomeStack(BuildContext context) {
    return SizedBox(
      height: 350.v,
      width: 347.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 7.v),
                TextFormField(
                  validator: EmailValidator,
                  controller: emailController,
                  style:
                      TextStyle(color: Colors.black), // Set text color to white
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                    hintStyle: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w400,
                    ), // Set hint text color to white
                    fillColor: theme.colorScheme.onPrimaryContainer,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0), // Adjust text field dimensions

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appTheme.accessTheme3, width: 2.0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 164, 37, 27)),
                    ),
                  ),
                ),
                SizedBox(height: 1.v),
                Text(
                  "Password",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.black),
                ),
                SizedBox(height: 7.v),
                Padding(
                  padding: EdgeInsets.only(
                    right: 11.h,
                  ),
                  child: CustomTextFormField(
                    controller: passwordController,
                    obscureText: _obscureTextPass,

                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: IconButton(
                      icon: Icon(
                        _obscureTextPass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                        size: 17.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextPass = !_obscureTextPass;
                        });
                      },
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: 55.v,
                    ),
                    // obscureText: true,
                    contentPadding: EdgeInsets.only(
                      left: 20.h,
                      top: 17.v,
                      bottom: 17.v,
                    ),
                  ),
                ),
                SizedBox(height: 21.v),
                Padding(
                  padding: EdgeInsets.only(right: 10.h),
                  child: Row(
                    children: [
                      Switch(
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor:Color.fromARGB(255, 81, 80, 80),
                        activeColor: Colors.green,
                        value: _isRemembered, // Flag to track switch state
                        onChanged: (newValue) =>
                            setState(() => _isRemembered = newValue),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                          bottom: 3.v,
                        ),
                        child: Text(
                          "Remember me",
                          style: CustomTextStyles.bodyMediumLato,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen()),
                            );
                          },
                          child: Text(
                            "Forgot password?",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgGroup6,
            height: 110.v,
            width: 125.h,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 90.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 9.h,
        right: 9.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 102.h,
              child: Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
            ),
            child: Text(
              "Or Log in with",
              style: CustomTextStyles.bodyLarge_1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 102.h,
              child: Divider(
                indent: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaRow(BuildContext context) {
    return Container(
// child: Padding(
//         padding: EdgeInsets.only(
//           left: 9.h,
//           right: 18.h,
//         ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            height: 60.v,
            width: 80.h,
            padding: EdgeInsets.all(8.h),
            child: GestureDetector(
            onTap: () {
              firebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithGoogle(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgGrommetIconsGoogle,
              height: 25.v,
              width: 40.h,
              alignment: Alignment.center,
            ),
          ),
          ),
          Container(
            height: 60.v,
            width: 80.h,
            margin: EdgeInsets.only(left: 10.h),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
              color: Colors.black,
            ),
            child: GestureDetector(
            onTap: () {
              firebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithTwitter(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 25.v,
              width: 40.h,
              alignment: Alignment.center,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomIconButton(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusStyle.roundedBorder6,
              ),
              height: 60.v,
              width: 80.h,
              padding: EdgeInsets.all(8.h),
              child: GestureDetector(
            onTap: () {
              firebaseAuthMethods(FirebaseAuth.instance)
                  .signInWithFacebook(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgFacebook,
              height: 25.v,
              width: 40.h,
              alignment: Alignment.center,
            ),
          ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
