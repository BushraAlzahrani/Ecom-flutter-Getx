import 'package:ecom_app/utils/theme.dart';
import 'package:ecom_app/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      onPressed: onPressed,
      child: TextUtils(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
