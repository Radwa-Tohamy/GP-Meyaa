import 'package:flutter/material.dart';
import 'package:meyaa/core/app_export.dart';
import 'package:meyaa/presentation/homepagenochatlight_page/homepagenochatlight_page.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomPopup extends StatefulWidget {
  @override
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  List<bool> checkboxValues = [false, false, false, false, false, false];
  List<Permission> grantedPermissions = [];

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
                buildCheckboxListTile('Allow MEYAA to Access your Camera', 0,
                    appTheme.accessTheme3),
                buildCheckboxListTile(
                    'Allow MEYAA to Access your Photos & Storage',
                    1,
                    appTheme.accessTheme3),
                buildCheckboxListTile(
                    'Allow MEYAA to Record Audio', 2, appTheme.accessTheme3),
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () => onTapGetStarted(context),
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
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

  void onTapGetStarted(BuildContext context) async {
    grantedPermissions.clear(); // Clear previously granted permissions

    // Request permissions based on selected checkboxes
    for (int i = 0; i < checkboxValues.length; i++) {
      if (checkboxValues[i]) {
        final permission = _getPermissionByIndex(i);
        final permissionStatus = await permission.request();
        if (permissionStatus.isGranted) {
          setState(() {
            grantedPermissions.add(permission);
          });
          print('Permission granted for: ${permission.toString()}');
        } else {
          print('Permission denied: ${permission.toString()}');
          _showPermissionDeniedSnackbar(permission);
        }
      }
    }

    // Handle granted permissions (if any)
    if (grantedPermissions.isNotEmpty) {
      // Perform actions based on the granted permissions (e.g., access storage, photos)
      // You can use the grantedPermissions list to determine which permissions were granted
    } else {
      // No permissions granted, handle the case if needed
    }

    // You can optionally navigate to the next screen here (consider after handling permissions)
    Navigator.pushNamed(context, AppRoutes.homepagenochatlightContainerScreen);
  }

  Permission _getPermissionByIndex(int index) {
    switch (index) {
      case 0:
        return Permission.camera;
      case 1:
        return Permission.storage;
      case 2:
        return Permission.microphone;
      default:
        throw Exception('Invalid checkbox index');
    }
  }

  void _showPermissionDeniedSnackbar(Permission permission) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Permission for ${permission.toString()} denied'),
        action: SnackBarAction(
          label: 'Settings',
          onPressed: () => openAppSettings(),
        ),
      ),
    );
  }
}