import 'package:ecom_app/logic/controllers/main_controller.dart';
import 'package:ecom_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/images/shop.png'))
          ],
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home,
                 color:  Get.isDarkMode ? mainColor : pinkClr,),
                icon: Icon(
                  Icons.home,
                  color:  Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),

                  BottomNavigationBarItem(
                activeIcon: Icon(Icons.category,
                 color:  Get.isDarkMode ? mainColor : pinkClr,),
                icon: Icon(
                  Icons.category,
                  color:  Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),

                  BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite,
                 color:  Get.isDarkMode ? mainColor : pinkClr,),
                icon: Icon(
                  Icons.favorite,
                  color:  Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),

                  BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings,
                 color:  Get.isDarkMode ? mainColor : pinkClr,),
                icon: Icon(
                  Icons.settings,
                  color:  Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: ''),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
        ),
        body: IndexedStack(index: controller.currentIndex.value,
        children: controller.taps.value,),
      );
      })
    );
  }
}
