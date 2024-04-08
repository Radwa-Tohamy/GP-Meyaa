import 'package:flutter/material.dart';

import 'package:meyaa/core/app_export.dart';

import 'package:meyaa/presentation/homepagenochatlight_page/homepagenochatlight_page.dart';

class CustomPopup extends StatefulWidget {
  @override
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  List<bool> checkboxValues = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent.withOpacity(0.8),
      child: contentBox(context),
    );
  }

  // Widget contentBox(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       // color: Colors.white,
  //       boxShadow:  [
  //     BoxShadow(
  //       color: Colors.grey.withOpacity(0.5),
  //       spreadRadius: 5,
  //       blurRadius: 7,
  //       offset: Offset(0, 3), // changes position of shadow
  //     ),
  //   ],
  //       gradient: LinearGradient(
  //         begin: Alignment(0, 0),
  //         end: Alignment(-0.21, 0.08),
  //         colors: [
  //           // appTheme.purple900.withOpacity(0.6),

  //           // appTheme.purple90033.withOpacity(0.5),
  //           // appTheme.gray500.withOpacity(0.7),

  //           appTheme.purple9003301.withOpacity(0.55),
  //           appTheme.purple90033.withOpacity(0.6),
  //           appTheme.purple9003301.withOpacity(0.33),
  //         ],
  //       ),

  //       borderRadius: BorderRadius.circular(50),
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.all(16),
  //           child: Column(
  //             children: <Widget>[
  //               buildCheckboxListTile('Allow MEYAA to Access your Calender', 0,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //               buildCheckboxListTile('Allow MEYAA to Access your Gmail', 1,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //               buildCheckboxListTile('Allow MEYAA to Access your Contact', 2,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //               buildCheckboxListTile('Allow MEYAA to Access your Camera', 3,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //               buildCheckboxListTile('Allow MEYAA to Access your Spotify', 4,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //               buildCheckboxListTile('Allow MEYAA to Access your Clock', 5,
  //                   Color.fromARGB(255, 173, 108, 184)),
  //             ],
  //           ),
  //         ),
  //         SizedBox(
  //           height: 8,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: <Widget>[
  //             SizedBox(
  //               width: 30,
  //             ),

  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.white,
  //                 onPrimary: Color.fromARGB(255, 173, 108, 184),
  //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  //               ),
  //               onPressed: () {
  //                 // Handle submit button action
  //                 onTapGetStarted(context);
  //               },
  //               child: Text(
  //                 'Submit',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16),
  //       ],
  //     ),
  //   );
  // }

  Widget contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(-0.21, 0.08),
          colors: [
            appTheme.accessTheme1,
            // appTheme.purple90033,
            appTheme.whiteA700,
            // appTheme.whiteA700.withOpacity(0.0),
          ],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                buildCheckboxListTile('Allow MEYAA to Access your Calender', 0,
                    appTheme.accessTheme3),
                buildCheckboxListTile('Allow MEYAA to Access your Gmail', 1,
                    appTheme.accessTheme3),
                buildCheckboxListTile('Allow MEYAA to Access your Contact', 2,
                    appTheme.accessTheme3),
                buildCheckboxListTile('Allow MEYAA to Access your Camera', 3,
                    appTheme.accessTheme3),
                buildCheckboxListTile('Allow MEYAA to Access your Spotify', 4,
                    appTheme.accessTheme3),
                buildCheckboxListTile('Allow MEYAA to Access your Clock', 5,
                    appTheme.accessTheme3),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: appTheme.accessTheme2,
                    // onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the border radius as needed
                    ),
                  ),
                  onPressed: () {
                    onTapGetStarted(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildCheckboxListTile(String title, int index, Color backgroundColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0, top: 15.0),

      // Adjust the bottom margin as needed
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the border radius as needed
          color: backgroundColor,
        ),
        child: CheckboxListTile(
          title: Text(
            title,
            style: TextStyle(
              color: checkboxValues[index] ? Colors.black : Colors.white,
            ),
          ),
          value: checkboxValues[index],
          onChanged: (value) {
            setState(() {
              checkboxValues[index] = value!;
            });
          },
        ),
      ),
    );
  }
}

onTapGetStarted(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homepagenochatlightContainerScreen);
}
