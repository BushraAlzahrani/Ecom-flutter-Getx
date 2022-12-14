import 'package:ecom_app/logic/controllers/auth_controller.dart';
import 'package:ecom_app/utils/theme.dart';
import 'package:ecom_app/views/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/auth/text_from_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
              backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white ,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              child: Form(
                key: formKey,
                child: Column(children: [
                  Row(
                    children: [
                      TextUtils(
                          text: 'SGIN',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? pinkClr : mainColor ,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        width: 3,
                      ),
                      TextUtils(
                          text: 'UP',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white :Colors.black,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFromField(
                      controller: nameController,
                      obscureText: false,
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value)) {
                          return 'Enter Valid name';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Image.asset(
                        'assets/images/user.png',
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      suffixIcon: Text(''),
                      hintText: 'User Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextFromField(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Image.asset('assets/images/email.png',
                          color: Get.isDarkMode ? pinkClr : mainColor,),
                      suffixIcon: Text(''),
                      hintText: 'Email'),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthTextFromField(
                        controller: passwordController,
                        obscureText: controller.isVisibility ? false : true,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset('assets/images/lock.png',
                            color: Get.isDarkMode ? pinkClr : mainColor,),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          icon: controller.isVisibility
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                ),
                        ),
                        hintText: 'Password');
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  CheckWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (controller.isCheckBox == false) {
                          Get.snackbar(
                              'Check Box', 'Please, Accept terms & conditions',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.green,
                              colorText: Colors.white);
                        } else if (formKey.currentState!.validate()) {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String password = passwordController.text;
                          controller.signUpUsingFirebase(
                              name: name, email: email, password: password);
                              controller.isCheckBox == true;
                        }
                      },
                      text: 'SGIN UP',
                    );
                  })
                ]),
              ),
            ),
          ),
          ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.loginInScreen);
              },
              text: 'Already Have an Account?',
              buttonText: 'Log in')
        ]),
      ),
    ));
  }
}
