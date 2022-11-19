import 'package:ecom_app/logic/bindings/auth_binding.dart';
import 'package:ecom_app/logic/bindings/main_binding.dart';
import 'package:ecom_app/logic/bindings/product_binding.dart';
import 'package:ecom_app/views/screens/auth/cart_screen.dart';
import 'package:ecom_app/views/screens/auth/forgot_password_screen.dart';
import 'package:ecom_app/views/screens/auth/signup_screen.dart';
import 'package:get/get.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/main_screen.dart';
import '../views/screens/welcome_screen.dart';

class AppRoute {
  // initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

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
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductBindings()]),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBindings(),
        
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginInScreen = '/loginInScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
