import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 80.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 80.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 81.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.deepPurpleA10001,
            borderRadius: BorderRadius.circular(
              30.h,
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill,
}
