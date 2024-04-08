import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue400,
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray100,
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA10001,
      );
  static BoxDecoration get fillGray9007f => BoxDecoration(
        color: appTheme.gray9007f,
      );
  static BoxDecoration get fillGrayF => BoxDecoration(
        color: appTheme.gray5007f,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.5),
      );
  static BoxDecoration get fillOnPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple90001.withOpacity(0.5),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientDeepPurpleAToWhiteA => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.89, 0),
          end: Alignment(-0.04, 0.81),
          colors: [
            appTheme.deepPurpleA100,
            appTheme.deepPurple20001,
            appTheme.whiteA700,
          ],
        ),
      );
  static BoxDecoration get gradientIndigoToIndigo => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.98, 0),
          end: Alignment(0, 1),
          colors: [
            appTheme.indigo40019,
            appTheme.indigo40019,
          ],
        ),
      );
  static BoxDecoration get gradientOnSecondaryContainerToPurple =>
      BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(1),
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.02),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onSecondaryContainer,
            appTheme.purple80000,
          ],
        ),
      );
  static BoxDecoration get gradientPurple9003301ToSecondaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -0.02),
          end: Alignment(-0.21, 0.08),
          colors: [
            appTheme.purple9003301,
            appTheme.purple90033,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientPurple9003301ToSecondaryContainer1 =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(-0.21, 0.08),
          colors: [
            appTheme.purple9003301,
            appTheme.purple90033,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleToSecondaryContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.11, 0.1),
          end: Alignment(0.38, 0.27),
          colors: [
            appTheme.purple9003301,
            appTheme.purple90033,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );

  // Outline decorations
    static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.gray80026,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.02),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2.77,
            ),
          ),
        ],
      );

      
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.02),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2.77,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.purple90001.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePurple => BoxDecoration(
        border: Border.all(
          color: appTheme.purple90001.withOpacity(0.5),
          width: 4.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlinePurple200 => BoxDecoration(
        color: appTheme.deepPurpleA10001,
        border: Border.all(
          color: appTheme.purple200,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlinePurple20001 => BoxDecoration(
        color: appTheme.deepPurpleA10001,
        border: Border.all(
          color: appTheme.purple20001,
          width: 1.h,
          strokeAlign: strokeAlignOutside,
        ),
      );
  static BoxDecoration get outlinePurple90001 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.purple90001.withOpacity(0.5),
            width: 4.h,
          ),
        ),
      );
       static BoxDecoration get outlinePurpleF => BoxDecoration(
        border: Border.all(
          color: appTheme.purple90033,
          width: 4.h,
          strokeAlign: strokeAlignOutside,
        ),
      );

}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get circleBorder23 => BorderRadius.circular(
        23.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL15 => BorderRadius.only(
        topRight: Radius.circular(15.h),
        bottomLeft: Radius.circular(15.h),
        bottomRight: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL15 => BorderRadius.only(
        topLeft: Radius.circular(15.h),
        bottomLeft: Radius.circular(15.h),
        bottomRight: Radius.circular(15.h),
      );
  static BorderRadius get customBorderTL26 => BorderRadius.only(
        topLeft: Radius.circular(26.h),
        topRight: Radius.circular(25.h),
        bottomLeft: Radius.circular(26.h),
        bottomRight: Radius.circular(25.h),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );
  static BorderRadius get customBorderTL40 => BorderRadius.vertical(
        top: Radius.circular(40.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder35 => BorderRadius.circular(
        35.h,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
