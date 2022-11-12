import 'package:ecom_app/logic/controllers/auth_controller.dart';
import 'package:ecom_app/utils/theme.dart';
import 'package:ecom_app/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/auth/text_from_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

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
                          text: 'LOG',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          underLine: TextDecoration.none),
                      const SizedBox(
                        width: 3,
                      ),
                      TextUtils(
                          text: 'IN',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white :Colors.black ,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
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
                          color: Get.isDarkMode ? pinkClr : mainColor ),
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
                            color: Get.isDarkMode ? pinkClr : mainColor),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.forgetPasswordScreen);
                        },
                        child: TextUtils(
                            text: 'Forget Password ?',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? Colors.white : Colors.black ,
                            underLine: TextDecoration.none)),
                  ),
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
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          String password = passwordController.text;
                          controller.logInUsingFirebase(
                              email: email, password: password);
                          controller.isCheckBox == true;
                        }
                      },
                      text: 'LOG IN',
                    );
                  }),
                  const SizedBox(height: 20),
                  TextUtils(
                      text: 'OR',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Image.asset('assets/images/facebook.png')),
                      const SizedBox(width: 10),
                    GetBuilder<AuthController>(builder: (_){
                        return   InkWell(
                          onTap: () {
                            controller.googleSignUp();
                          },
                          child: Image.asset('assets/images/google.png'));
                    }),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
              text: "Don't Have an Account?",
              buttonText: 'Sign Up')
        ]),
      ),
    ));
  }
}
