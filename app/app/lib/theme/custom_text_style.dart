import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeRubikBluegray800 =>
      theme.textTheme.bodyLarge!.rubik.copyWith(
        color: appTheme.blueGray800,
        fontSize: 18.fSize,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumLato => theme.textTheme.bodyMedium!.lato.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumLatoWhiteA700 =>
      theme.textTheme.bodyMedium!.lato.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
      );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumPoppinsWhiteA700 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumRubik => theme.textTheme.bodyMedium!.rubik.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  // Display text style
  static get displaySmallLatoPrimary =>
      theme.textTheme.displaySmall!.lato.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  // Headline text style
  static get headlineMediumBluegray900 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallInterBluegray800 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w900,
      );
  static get headlineSmallInterBluegray900 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get headlineSmallInterBluegray900_1 =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get headlineSmallInterPrimary =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 24.fSize,
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallInterPrimarySemiBold =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 24.fSize,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallPoppins =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallPoppinsWhiteA700 =>
      theme.textTheme.headlineSmall!.poppins.copyWith(
        color: appTheme.whiteA700.withOpacity(0.64),
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallPrimaryRegular =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallInterPrimaryMedium =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 24.fSize,
        fontWeight: FontWeight.w500,
      );
  // Inter text style
  static get interGray100 => TextStyle(
        color: appTheme.gray100,
        fontSize: 69.fSize,
        fontWeight: FontWeight.w900,
      ).inter;
  // Label text style
  static get labelMediumDeeppurple200 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepPurple200,
      );
  static get labelMediumInter => theme.textTheme.labelMedium!.inter.copyWith(
        fontWeight: FontWeight.w900,
      );
  // Title text style
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargeInterBluegray900 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleLargeInterWhiteA700 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleLargePoppins => theme.textTheme.titleLarge!.poppins.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleLargePoppinsBluegray900 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleLargePoppinsPrimary =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.64),
      );
  static get titleLargeRoboto => theme.textTheme.titleLarge!.roboto;
  static get titleLargeRubik => theme.textTheme.titleLarge!.rubik.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleMediumOutfit => theme.textTheme.titleMedium!.outfit.copyWith(
        fontSize: 18.fSize,
        color: Colors.black,
      );
  static get titleLargeRubikRegular =>
      theme.textTheme.titleLarge!.rubik.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumGray10001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray10001,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter;
  static get titleMediumInterBluegray900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray900,
        fontSize: 18.fSize,
      );
  static get titleMediumInterBluegray90018 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.blueGray900,
        fontSize: 18.fSize,
      );
  static get titleMediumInterGray100 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray100,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterMedium =>
      theme.textTheme.titleMedium!.inter.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterPrimary =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterPrimary_1 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get titleMediumLatoPrimary =>
      theme.textTheme.titleMedium!.lato.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnError => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get titleMediumOutfitPrimary =>
      theme.textTheme.titleMedium!.outfit.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get titleSmallBluegray90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90002,
      );
  static get titleSmallPoppinsErrorContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsPrimary =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPoppinsWhiteA700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargePrimary22 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 22.fSize,
      );
  static get titleMediumRoboto => theme.textTheme.titleMedium!.roboto.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumRoboto18 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumRobotoMedium =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get rubik {
    return copyWith(
      fontFamily: 'Rubik',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
