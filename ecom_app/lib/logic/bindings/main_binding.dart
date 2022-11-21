import 'package:ecom_app/logic/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class MainBinding extends Bindings{

  @override
  void dependencies() {
   Get.put(MainController());
      Get.put(SettingController());
  }}