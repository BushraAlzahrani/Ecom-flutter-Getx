import 'package:ecom_app/logic/bindings/auth_binding.dart';
import 'package:ecom_app/views/screens/auth/forgot_password_screen.dart';
import 'package:ecom_app/views/screens/auth/signup_screen.dart';
import 'package:get/get.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/welcome_screen.dart';

class AppRoute {
  // initialRoute
  static const welcome = Routes.welcomeScreen;

  //GetPage

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
      name: Routes.loginInScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginInScreen = '/loginInScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
}
