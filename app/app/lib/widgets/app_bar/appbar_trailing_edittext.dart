import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AppbarTrailingEdittext extends StatelessWidget {
  AppbarTrailingEdittext(
      {Key? key, this.hintText, this.controller, this.margin})
      : super(
          key: key,
        );

  String? hintText;

  TextEditingController? controller;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomTextFormField(
        width: 80.h,
        controller: controller,
        hintText: "Save",
        hintStyle: CustomTextStyles.titleMediumInterPrimary,
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        fillColor: appTheme.gray100.withOpacity(0.61),
      ),
    );
  }
}
