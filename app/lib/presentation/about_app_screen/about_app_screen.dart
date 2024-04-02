import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

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
                        begin: Alignment(0.98, 0),
                        end: Alignment(0, 1),
                        colors: [appTheme.indigo40019, appTheme.indigo40019])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: Column(children: [
                      SizedBox(height: 55.v),
                      _buildArrowLeft(context),
                      SizedBox(height: 13.v),
                      CustomImageView(
                          imagePath:
                              ImageConstant.imgOip2RemovebgPreview361x307,
                          height: 139.v,
                          width: 144.h,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 100.h)),
                      Container(
                          decoration: AppDecoration.outlinePrimary,
                          child: Text("  MEYAA",
                              style: CustomTextStyles
                                  .headlineSmallInterBluegray800)),
                      SizedBox(height: 29.v),
                      SizedBox(
                          height: 484.v,
                          width: 353.h,
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    width: 330.h,
                                    margin:
                                        EdgeInsets.only(left: 5.h, top: 38.v),
                                    child: Text(
                                        "this application provide a better \n      solution for the users who are \n      looking for a personal virtual \n      assistant that can help them with\n      both their personal life tasks and \n      real estate-related tasks.\n\nit also have a voice-based & \n     chat-based interaction mode that \n     can understand natural language \n    and provide feedback.\n\nthis application is for both Android \n     & IOS smart phones.",
                                        maxLines: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyLargeRubikBluegray800))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 484.v,
                                    width: 353.h,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: appTheme.purple90001,
                                                width: 4.h)))))
                          ]))
                    ])))));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 29.h),
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 7.v),
        decoration: AppDecoration.fillDeepPurpleA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL26),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          CustomImageView(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              height: 30.v,
              width: 26.h,
              margin: EdgeInsets.only(top: 3.v, bottom: 2.v),
              onTap: () {
                onTapImgArrowLeft(context);
              }),
          Padding(
              padding: EdgeInsets.only(left: 17.h, top: 6.v),
              child: Text("About App", style: theme.textTheme.headlineSmall))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
