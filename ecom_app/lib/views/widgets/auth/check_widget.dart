import 'package:ecom_app/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/theme.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
   

final controller = Get.find<AuthController>(); 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
      children: [
        InkWell(
          onTap: () {
            controller.checkBox();
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: controller.isCheckBox? Image.asset('assets/images/check.png', color: Get.isDarkMode? mainColor : pinkClr): Container(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtils(
                text: 'I accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode? Colors.black: Colors.white,
                underLine: TextDecoration.none),
                TextUtils(
                text: 'terms & conditions',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode? Colors.black: Colors.white,
                underLine: TextDecoration.underline),
          ],
        )
      ],
    );
    });
  }
}
