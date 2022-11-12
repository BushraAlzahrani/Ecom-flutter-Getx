import 'package:ecom_app/logic/controllers/auth_controller.dart';
import 'package:ecom_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (_) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Logout From App',
                    titleStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    middleText: 'Are you sure you want to logout',
                    middleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: ' No ',
                    cancelTextColor: Colors.white,
                    textConfirm: ' Yes ',
                    confirmTextColor: Colors.white,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ?  pinkClr: mainColor,
                  );
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
