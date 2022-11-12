import 'package:ecom_app/views/screens/category_screen.dart';
import 'package:ecom_app/views/screens/favorites_screen.dart';
import 'package:ecom_app/views/screens/home_screen.dart';
import 'package:ecom_app/views/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final taps = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    'Asroo Shop',
    'Category',
    'Favorites',
    'Settings',
  ];
}
