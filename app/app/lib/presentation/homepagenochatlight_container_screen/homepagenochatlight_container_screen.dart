import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/homepagenochatlight_page/homepagenochatlight_page.dart';
import 'package:meyaa/widgets/custom_bottom_app_bar.dart';
import 'package:meyaa/presentation/chatbott_screen/chatbott_screen.dart';

// ignore_for_file: must_be_immutable
class HomepagenochatlightContainerScreen extends StatelessWidget {
  HomepagenochatlightContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
                appTheme.indigo40033
              ],
            ),
          ),
          child: Stack(
            children: [
              Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homepagenochatlightPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                  pageBuilder: (ctx, ani, ani1) =>
                      getCurrentPage(routeSetting.name!),
                  transitionDuration: Duration(seconds: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomAppBar(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homepagenochatlightPage;
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homepagenochatlightPage:
        return HomepagenochatlightPage();

      case AppRoutes.chatbottScreen:
        return ChatbottScreen();

      default:
        return DefaultWidget();
    }
  }
}
