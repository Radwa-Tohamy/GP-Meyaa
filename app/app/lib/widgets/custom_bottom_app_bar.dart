import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgHome,
        activeIcon: ImageConstant.imgHome,
        title: "Home",
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
      icon: ImageConstant.imgVectorPrimary21x21,
      activeIcon: ImageConstant.imgVectorPrimary21x21,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: SizedBox(
        height: 19.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: bottomMenuList[index].activeIcon,
                            height: 19.v,
                            width: 25.h,
                            color: appTheme.purple400,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text(
                              bottomMenuList[index].title ?? "",
                              style: CustomTextStyles.labelMediumDeeppurple200
                                  .copyWith(
                                color: appTheme.deepPurple200,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 50.v,
                        width: 54.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 50.v,
                                width: 54.h,
                                decoration: BoxDecoration(
                                  color: appTheme.purple400,
                                  borderRadius: BorderRadius.circular(
                                    27.h,
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: bottomMenuList[index].icon,
                              height: 21.adaptSize,
                              width: 21.adaptSize,
                              color: theme.colorScheme.primary.withOpacity(1),
                              alignment: Alignment.center,
                              margin:
                                  EdgeInsets.fromLTRB(17.h, 14.v, 15.h, 14.v),
                            ),
                          ],
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
