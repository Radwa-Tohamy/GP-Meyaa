import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "APP Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.appScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SIGN UP",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "LOGIN",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "FORGET PASSWORD",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "VERFICATION",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.verficationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "welcome Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "HomePageNoChatLight - Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.homepagenochatlightContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Chatbott Screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.chatbottScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "HomePageLight",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homepagelightScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Setting",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Access Message",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.accessMessageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Android Large - Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.androidLargeTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Change Password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.changePasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "About App",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.aboutAppScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
