import 'package:flutter/material.dart';

import 'package:meyaa/presentation/app_screen/app_screen.dart';
import 'package:meyaa/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:meyaa/presentation/mobile_login_screen/mobile_login_screen.dart';

import 'package:meyaa/presentation/verfication_screen/verfication_screen.dart';
import 'package:meyaa/presentation/welcome_screen/welcome_screen.dart';
import 'package:meyaa/presentation/homepagenochatlight_container_screen/homepagenochatlight_container_screen.dart';
import 'package:meyaa/presentation/chatbott_screen/chatbott_screen.dart';
// import 'package:meyaa/presentation/homepagelight_screen/homepagelight_screen.dart';
import 'package:meyaa/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:meyaa/presentation/setting_screen/setting_screen.dart';
import 'package:meyaa/presentation/edit_profile_screen/edit_profile_screen.dart';
// import 'package:meyaa/presentation/access_message_screen/access_message_screen.dart';
// import 'package:meyaa/presentation/android_large_two_screen/android_large_two_screen.dart';
import 'package:meyaa/presentation/change_password_screen/change_password_screen.dart';
import 'package:meyaa/presentation/about_app_screen/about_app_screen.dart';
import 'package:meyaa/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/forget_password_screen/forget_password_screen.dart';

class AppRoutes {
  static const String appScreen = '/app_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String loginScreen = '/login_screen';

  static const String forgetPasswordScreen = '/forget_password_screen';
  static const String verficationScreen = '/verfication_screen';

  static const String welcomeScreen =
      '/lib/presentation/welcome_screen/welcome_screen.dart';

  static const String homepagenochatlightPage = '/homepagenochatlight_page';

  static const String homepagenochatlightContainerScreen =
      '/homepagenochatlight_container_screen';

  static const String chatbottScreen = '/chatbott_screen';

  static const String homepagelightScreen = '/homepagelight_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String settingScreen = '/setting_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String accessMessageScreen = '/access_message_screen';

  static const String androidLargeTwoScreen = '/android_large_two_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String aboutAppScreen = '/about_app_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    appScreen: (context) => AppScreen(),
    loginScreen: (context) => mobile_login_screen(),
    signUpScreen: (context) => SignUpScreen(),
    forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    verficationScreen: (context) => VerficationScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    homepagenochatlightContainerScreen: (context) =>
        HomepagenochatlightContainerScreen(),
    chatbottScreen: (context) => ChatbottScreen(),
    // homepagelightScreen: (context) => HomepagelightScreen(),
    myProfileScreen: (context) => MyProfileScreen(),
    settingScreen: (context) => SettingScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
    // accessMessageScreen: (context) => AccessMessageScreen(),
    // androidLargeTwoScreen: (context) => AndroidLargeTwoScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    aboutAppScreen: (context) => AboutAppScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
