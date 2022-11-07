import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: TextUtils(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  text: 'Welcome',
                  color: Colors.white,
                   underLine: TextDecoration.none,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextUtils(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    text: 'Asroo',
                    color: mainColor,
                     underLine: TextDecoration.none,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  TextUtils(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    text: 'Shop',
                    color: Colors.white,
                     underLine: TextDecoration.none,
                  ),
                ]),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )),
                  onPressed: () {
                    Get.offNamed(Routes.loginInScreen);
                  },
                  child: TextUtils(
                    text: 'Get Started',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                     underLine: TextDecoration.none,
                  )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      text: "Don't have an Account?",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                       underLine: TextDecoration.none),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signUpScreen);
                      },
                      child: TextUtils(
                          text: 'Sign Up',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underLine: TextDecoration.underline))
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
