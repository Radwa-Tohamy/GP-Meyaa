import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/app_bar/appbar_title.dart';
import 'package:meyaa/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HomepagenochatlightPage extends StatelessWidget {
  const HomepagenochatlightPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
                // appTheme.blueGray10001,
                appTheme.purple9003301,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVector(context),
                SizedBox(height: 40.v),
                _buildChatHistory(context),
                SizedBox(height: 12.v),
                _buildAll(context),
                Spacer(
                  flex: 39,
                ),
                Container(
                  height: 81.v,
                  width: 87.h,
                  margin: EdgeInsets.only(left: 117.h),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 65.v,
                          width: 67.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: fs.Svg(
                                ImageConstant.imgGroup19,
                              ),
                              // fit: BoxFit.cover,
                            ),
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVectorBlue700,
                            height: 62.v,
                            width: 64.h,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVectorGreen500,
                        height: 65.v,
                        width: 67.h,
                        alignment: Alignment.topLeft,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVectorGreen700,
                        height: 45.v,
                        width: 46.h,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 16.h),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgFlag,
                        height: 16.v,
                        width: 39.h,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                          left: 16.h,
                          top: 24.v,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.v),
                Padding(
                  padding: EdgeInsets.only(left: 96.h),
                  child: Text(
                    "No Chat History",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 8.v),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 237.h,
                    margin: EdgeInsets.only(
                      left: 46.h,
                      right: 48.h,
                    ),
                    child: Text(
                      "After your first chat you will be able to view it here",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyMediumRubik,
                    ),
                  ),
                ),
                Spacer(
                  flex: 60,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 50,
                // color: Colors.white,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.8,
                      // widthFactor: -2,
                      child: FloatingActionButton(
                        onPressed: () {
                          onTapGetStarted(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 45,
                        ),
                        backgroundColor: appTheme.AddColorIcon,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home, color: Colors.black, size: 35),
                          Container(
                            width: size.width * 0.50,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.myProfileScreen);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Section Widget

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 61.h,
      leading: Container(
        height: 46.v,
        width: 47.h,
        margin: EdgeInsets.only(
          left: 14.h,
          bottom: 0.09.v,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse5,
              height: 30.v,
              width: 43.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                left: 1.h,
                top: 22.v,
                right: 3.h,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgOip2RemovebgPreview46x47,
              height: 65.v,
              width: 470.h,
              radius: BorderRadius.circular(
                23.h,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
      title: AppbarTitle(
        text: "MEYAA",
        margin: EdgeInsets.only(left: 2.h, top: 20),
      ),
    );
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return Container(
      height: 100.v,
      width: 325.h,
      margin: EdgeInsets.only(left: 3.h, top: 60.h),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 10.v),
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
                vertical: 6.v,
              ),
              decoration: AppDecoration.outlinePurple200.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 145, 98, 154),
                    offset: Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12.v,
                    width: 9.h,
                    margin: EdgeInsets.only(
                      top: 51.v,
                      bottom: 8.v,
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorGray10001,
                          height: 8.v,
                          width: 9.h,
                          alignment: Alignment.bottomCenter,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorGray1000112x5,
                          height: 12.v,
                          width: 5.h,
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60.v,
                    width: 95.h,
                    margin: EdgeInsets.only(
                      left: 8.h,
                      top: 2.v,
                      bottom: 8.v,
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorBlueGray900,
                          height: 8.v,
                          width: 12.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 1.h),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorDeepOrange100,
                          height: 8.v,
                          width: 11.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            left: 12.h,
                            top: 8.v,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 6.adaptSize,
                          width: 6.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            left: 9.h,
                            top: 10.v,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorDeepOrange1007x3,
                          height: 7.v,
                          width: 3.h,
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(
                            left: 12.h,
                            bottom: 1.v,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorDeepOrange1007x3,
                          height: 7.v,
                          width: 2.h,
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(
                            left: 1.h,
                            bottom: 1.v,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorDeepOrange1006x6,
                          height: 6.adaptSize,
                          width: 6.adaptSize,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            left: 5.h,
                            top: 1.v,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 45.v,
                            width: 16.h,
                            margin: EdgeInsets.only(bottom: 5.v),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      ImageConstant.imgVectorBlueGray90045x16,
                                  height: 45.v,
                                  width: 16.h,
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 19.v,
                                    width: 5.h,
                                    margin: EdgeInsets.only(
                                      left: 2.h,
                                      top: 1.v,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: SizedBox(
                                            height: 17.v,
                                            child: VerticalDivider(
                                              width: 4.h,
                                              thickness: 4.v,
                                              color: appTheme.deepOrange100,
                                            ),
                                          ),
                                        ),
                                        CustomImageView(
                                          imagePath: ImageConstant
                                              .imgVectorIndigoA2005x4,
                                          height: 5.v,
                                          width: 4.h,
                                          alignment: Alignment.topRight,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 45.v,
                            width: 71.h,
                            margin: EdgeInsets.only(
                              right: 4.h,
                              bottom: 4.v,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgVectorBlueGray800,
                                  height: 45.v,
                                  width: 71.h,
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 40.v,
                                    width: 65.h,
                                    margin: EdgeInsets.only(bottom: 1.v),
                                    decoration: AppDecoration.fillWhiteA,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant
                                              .imgVectorGray1000140x47,
                                          height: 40.v,
                                          width: 47.h,
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 26.h,
                                              right: 23.h,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 14.v,
                                                  width: 16.h,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    children: [
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorBlueGray8005x2,
                                                        height: 5.v,
                                                        width: 2.h,
                                                        alignment:
                                                            Alignment.topRight,
                                                        margin: EdgeInsets.only(
                                                            top: 4.v),
                                                      ),
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorBlueGray8005x2,
                                                        height: 5.v,
                                                        width: 2.h,
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                            top: 4.v),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: SizedBox(
                                                          height: 14.adaptSize,
                                                          width: 14.adaptSize,
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            children: [
                                                              CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgVectorBlueGray80014x14,
                                                                height: 14
                                                                    .adaptSize,
                                                                width: 14
                                                                    .adaptSize,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                              ),
                                                              CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgVectorBlueGray8003x10,
                                                                height: 3.v,
                                                                width: 10.h,
                                                                alignment:
                                                                    Alignment
                                                                        .topCenter,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5
                                                                            .v),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 2.v),
                                                SizedBox(
                                                  height: 16.v,
                                                  width: 14.h,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorBlueGray8002x4,
                                                        height: 2.v,
                                                        width: 4.h,
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 3.h),
                                                      ),
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVector2x4,
                                                        height: 2.v,
                                                        width: 4.h,
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        margin: EdgeInsets.only(
                                                            right: 3.h),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: SizedBox(
                                                          height: 15.v,
                                                          width: 14.h,
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .topRight,
                                                            children: [
                                                              CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgVectorBlueGray80015x14,
                                                                height: 15.v,
                                                                width: 14.h,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child:
                                                                    Container(
                                                                  height: 1.v,
                                                                  width: 5.h,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 4.v,
                                                                    right: 1.h,
                                                                  ),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    children: [
                                                                      CustomImageView(
                                                                        imagePath:
                                                                            ImageConstant.imgVectorBlueGray8001x5,
                                                                        height:
                                                                            1.v,
                                                                        width:
                                                                            5.h,
                                                                        alignment:
                                                                            Alignment.center,
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 1.adaptSize,
                                                                              width: 1.adaptSize,
                                                                              decoration: BoxDecoration(
                                                                                color: theme.colorScheme.onError,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  1.h,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 1.adaptSize,
                                                                              width: 1.adaptSize,
                                                                              decoration: BoxDecoration(
                                                                                color: theme.colorScheme.onError,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  1.h,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 1.adaptSize,
                                                                              width: 1.adaptSize,
                                                                              decoration: BoxDecoration(
                                                                                color: appTheme.indigoA200,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  1.h,
                                                                                ),
                                                                              ),
                                                                            ),
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
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorWhiteA7002x1,
                          height: 2.v,
                          width: 1.h,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            right: 38.h,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 78.h,
                            child: Divider(
                              color: appTheme.blueGray800,
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorWhiteA700,
                          height: 26.v,
                          width: 24.h,
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 1.h),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 26.v,
                            width: 25.h,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgVectorIndigoA200,
                                  height: 26.v,
                                  width: 25.h,
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 24.v,
                                    width: 18.h,
                                    margin: EdgeInsets.only(right: 1.h),
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Opacity(
                                          opacity: 0.1,
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgVectorPrimary,
                                            height: 24.v,
                                            width: 11.h,
                                            alignment: Alignment.centerRight,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            height: 1.v,
                                            width: 14.h,
                                            margin: EdgeInsets.only(
                                              left: 1.h,
                                              top: 4.v,
                                            ),
                                            decoration: BoxDecoration(
                                              color: appTheme.indigoA200,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            height: 1.v,
                                            width: 14.h,
                                            margin:
                                                EdgeInsets.only(bottom: 8.v),
                                            decoration: BoxDecoration(
                                              color: appTheme.indigoA200,
                                            ),
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
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorBlueGray9004x7,
                          height: 4.v,
                          width: 7.h,
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            left: 5.h,
                            top: 1.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 151.h,
                          child: Text(
                            "Let’s see\nWhat i can do for you ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles
                                .titleSmallPoppinsErrorContainer,
                          ),
                        ),
                        SizedBox(height: 7.v),
                        SizedBox(
                          height: 21.v,
                          width: 108.h,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 20.v,
                                  width: 108.h,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.h,
                                    vertical: 4.v,
                                  ),
                                  decoration: AppDecoration.fillPrimaryContainer
                                      .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder6,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgPlay,
                                    height: 12.v,
                                    width: 10.h,
                                    alignment: Alignment.centerRight,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  onTapGetStarted(context);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12.h),
                                  child: Text(
                                    "Chat Now",
                                    style: CustomTextStyles
                                        .titleSmallPoppinsWhiteA700,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  onTapGetStarted(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUndrawChatBotReE2gj,
            height: 82.v,
            width: 97.h,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 27.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChatHistory(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Text(
            "Chat History",
            style: CustomTextStyles.titleSmallPoppinsPrimary,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(
            "View ALL",
            style: CustomTextStyles.bodyMediumPoppins,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 15.h,
      ),
      child: Row(
        children: [
          Container(
            width: 98.h,
            padding: EdgeInsets.symmetric(
              horizontal: 38.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillDeepPurpleA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            child: Text(
              "All",
              style: CustomTextStyles.titleMediumPrimary,
            ),
          ),
          Container(
            width: 94.h,
            margin: EdgeInsets.only(left: 13.h),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillGrayF.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder6,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                    blurRadius: 50,
                    offset: Offset(3, 3),
                  )
                ]),
            child: Text(
              "Saved",
              style: CustomTextStyles.titleMediumGray10001,
            ),
          ),
          Container(
            width: 96.h,
            margin: EdgeInsets.only(left: 13.h),
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder6,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                    blurRadius: 50,
                    offset: Offset(3, 3),
                  )
                ]),
            child: Text(
              "Recent",
              style: CustomTextStyles.titleMediumOnError,
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = appTheme.deepPurpleA100
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 10),
        radius: Radius.circular(5.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

onTapGetStarted(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.chatbottScreen);
}

//  onTapProfile(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.myProfileScreen);
//   }