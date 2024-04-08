import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meyaa/core/app_export.dart';

import 'package:meyaa/widgets/custom_elevated_button.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';
import 'package:meyaa/theme/app_decoration.dart';
import 'package:meyaa/responsive.dart';
import 'package:meyaa/services/firebase_auth_methods.dart';

// import 'package:firebase_auth_demo/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );
  @override
  _EmailPasswordSignupState createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<SignUpScreen> {
  bool _obscureTextPass = true;
  bool _obscureTextConPass = true;

  TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isVisible = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void signUpUser() async {
    firebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        UserName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        context: context);
    // context.read<FirebaseAuthMethods>().signUpWithEmail(
    //       email: emailController.text,
    //       password: passwordController.text,
    //       context: context,
    //     );
  }

  String? userNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Username cannot be empty.';
    } else if (value.length < 4) {
      return 'Username must be less than 5 characters.';
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
      return "Enter correct name Format (a-z A-Z])"; // Input is valid
    } else {
      return null;
    }
  }

  String? EmailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w]{2,4}').hasMatch(value!)) {
      return "Enter  Correct Email Format [\w-\.]+@([\w-]+.)+[\w]{2,4}"; // Input is valid
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value.length < 8) {
      return 'The password should be at least 8 characters long.';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Should contain Small letter one number and special character ";
      // Input is valid
    } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
      return 'Should contain At Least one capital letters';
    } else if (!RegExp(r'[0-9]').hasMatch(value!)) {
      return 'Should contain At Numbers';
    } else if (!RegExp(r'[!@#$%^&*()\-_=+{};:,<.>]').hasMatch(value!)) {
      return 'Should contain At Numbers';
    }
    // Input is val}id
    else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return ' confirm Password cannot be empty.';
    } else if (value != passwordController.text) {
      return ' does not match  password';
    }

    // Input is val}id
    else {
      return null;
    }
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
                  SizedBox(height: 0.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStackOne(context),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 18.v,
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
                                    padding: EdgeInsets.only(
                                      left: 90.h,
                                    ),
                                    child: Text(
                                      "Signup",
                                      style: theme.textTheme.displaySmall,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "User Name",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                _buildUserName(context),
                                SizedBox(height: 2.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "Email",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                _buildEmail(context),
                                SizedBox(height: 2.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "Password",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.v),
                                _buildPassword(context),
                                SizedBox(height: 2.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "Confirm password",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.v),
                                _buildConfirmPassword(context),
                                SizedBox(height: 25.v),
                                _buildSignUpButton(context),
                                SizedBox(height: 16.v),
                                _buildRowOne(context),
                                SizedBox(height: 13.v),
                                _buildRowTwo(context),
                                SizedBox(height: 35.v),
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
  Widget _buildStackOne(BuildContext context) {
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

  //Section Widget

  Widget _buildUserName(BuildContext context) {
    return TextFormField(
      controller: userNameController,
      validator: userNameValidator,
      style: TextStyle(color: Colors.black), // Set text color to white
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
            vertical: 5.0, horizontal: 10.0), // Adjust text field dimensions

        enabledBorder: OutlineInputBorder(
          // Set border color when the field is enabled (not focused)
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.white, // Set border color to white
            width: 1.0, // Adjust border width as needed
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.accessTheme3, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 164, 37, 27)),
        ),
      ),
    );
  }


  Widget _buildEmail(BuildContext context) {
    return TextFormField(
      validator: EmailValidator,
      controller: emailController,
      style: TextStyle(color: Colors.black), // Set text color to white
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
            vertical: 5.0, horizontal: 10.0), // Adjust text field dimensions

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.accessTheme3, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 164, 37, 27)),
        ),
      ),
    );
  }


  Widget _buildPassword(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: passwordValidator,
      obscureText: _obscureTextPass,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter password',
        hintStyle: GoogleFonts.outfit(
          color: Colors.white,
          fontSize: 15.fSize,
          fontWeight: FontWeight.w400,
        ),
        fillColor: theme.colorScheme.onPrimaryContainer,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.accessTheme3, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 164, 37, 27)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureTextPass ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
            size: 17.0,
          ),
          onPressed: () {
            setState(() {
              _obscureTextPass = !_obscureTextPass;
            });
          },
        ),
      ),
    );
  }


  Widget _buildConfirmPassword(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      validator: confirmPasswordValidator,
      obscureText: _obscureTextConPass, // Corrected variable name here
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter password',
        hintStyle: GoogleFonts.outfit(
          color: Colors.white,
          fontSize: 15.fSize,
          fontWeight: FontWeight.w400,
        ),
        fillColor: theme.colorScheme.onPrimaryContainer,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.accessTheme3, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 164, 37, 27)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureTextConPass ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
            size: 17.0,
          ),
          onPressed: () {
            setState(() {
              _obscureTextConPass = !_obscureTextConPass;
            });
          },
        ),
      ),
    );
  }


  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      height: 50.v,
      text: "Sign Up",
      margin: EdgeInsets.only(left: 34.h, right: 51.h),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          signUpUser(); // Corrected function call
          // Optionally, handle what happens after the user signs up
          // For example, you can navigate to a new screen or show a success message
        }
      },
    );
  }

  Widget _buildRowOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 97.h,
              child: Divider(),
            ),
          ),
          Text(
            "Or Sign up with",
            style: CustomTextStyles.bodyLarge_1,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 97.h,
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowTwo(BuildContext context) {
    return //Padding(
        // padding: EdgeInsets.only(left: 4.h),
        //child:
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.v,
          width: 90.h,
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder6,
            color: Colors.black,
          ),
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
          width: 90.h,
          // padding: EdgeInsets.symmetric(
          //   horizontal: 44.h,
          //   vertical: 17.v,
          // ),
          decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
              color: Colors.black),
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
        Container(
          height: 60.v,
          width: 90.h,
          // padding: EdgeInsets.symmetric(
          //   horizontal: 47.h,
          //   vertical: 11.v,
          // ),
          decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
              color: Colors.black),
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
        )
      ],
      // ),
    );
  }

  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomeScreen);
  }
}
